# https://github.com/cjdoris/Bokeh.jl

# Minimal implementation - Bokeh backend support
# Bokeh is a JavaScript-based interactive plotting library

should_warn_on_unsupported(::BokehBackend) = false

# Create the window/figure for this backend.
function _create_backend_figure(plt::Plot{BokehBackend})
    # Create a Bokeh figure
    # The figure will be created when Bokeh functions are called
    return plt.o = Bokeh.Figure()
end

# Initialize subplot
function _initialize_subplot(plt::Plot{BokehBackend}, sp::Subplot{BokehBackend})
    # Bokeh typically works with a single figure
    # Subplots could be handled via gridplot or layout
    return nothing
end

# Add one series to the underlying backend object
function _series_added(plt::Plot{BokehBackend}, series::Series)
    sp = series[:subplot]
    st = series[:seriestype]
    
    # Get the figure from the plot
    fig = plt.o
    
    # Get data
    x, y = series[:x], series[:y]
    
    # Handle different series types
    if st === :path || st === :line
        Bokeh.line!(fig, x, y)
    elseif st === :scatter
        Bokeh.scatter!(fig, x, y)
    else
        # For unsupported series types, fall back to line
        @debug "Series type $st not fully supported in Bokeh backend, using line"
        Bokeh.line!(fig, x, y)
    end
    
    return nothing
end

# Update plot attributes before display
function _update_plot_object(plt::Plot{BokehBackend})
    # Update title, labels, etc.
    for sp in plt.subplots
        if !isempty(sp[:title])
            plt.o.title = string(sp[:title])
        end
        if !isempty(sp[:xaxis][:guide])
            plt.o.xaxis_label = string(sp[:xaxis][:guide])
        end
        if !isempty(sp[:yaxis][:guide])
            plt.o.yaxis_label = string(sp[:yaxis][:guide])
        end
    end
    return nothing
end

# Display the plot
function _display(plt::Plot{BokehBackend})
    return Bokeh.show(plt.o)
end

# Define supported attributes for Bokeh
const _bokeh_attr = merge_with_base_supported([
    :annotations,
    :background_color_legend,
    :background_color_inside,
    :background_color_outside,
    :foreground_color_legend,
    :foreground_color_grid,
    :foreground_color_axis,
    :foreground_color_text,
    :foreground_color_border,
    :label,
    :seriescolor,
    :seriesalpha,
    :linecolor,
    :linestyle,
    :linewidth,
    :linealpha,
    :markershape,
    :markercolor,
    :markersize,
    :markeralpha,
    :markerstrokewidth,
    :markerstrokecolor,
    :markerstrokealpha,
    :fillrange,
    :fillcolor,
    :fillalpha,
    :bins,
    :layout,
    :title,
    :window_title,
    :guide,
    :guide_position,
    :lims,
    :ticks,
    :scale,
    :flip,
    :rotation,
    :titlefont,
    :guidefont,
    :tickfont,
    :legendfont,
])

# Define supported series types
const _bokeh_seriestype = [
    :path,
    :scatter,
    :line,
    :shape,
]

# Define supported markers
const _bokeh_marker = [
    :circle,
    :square,
    :diamond,
    :cross,
    :xcross,
    :triangle,
]

# Define supported styles
const _bokeh_style = [:auto, :solid, :dash, :dot, :dashdot]

# Define supported scales
const _bokeh_scale = [:identity, :log, :log10]

# Check if marker is supported
is_marker_supported(::BokehBackend, shape::Shape) = true
