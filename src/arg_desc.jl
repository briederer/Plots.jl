
const _arg_desc = KW(

    # series args
    :label              => "String type. The label for a series, which appears in a legend.  If empty, no legend entry is added.",
    :seriescolor        => "Color Type. The base color for this series.  `:auto` (the default) will select a color from the subplot's `color_palette`, based on the order it was added to the subplot",
    :seriesalpha        => "Number in [0,1]. The alpha/opacity override for the series.  `nothing` (the default) means it will take the alpha value of the color.",
    :seriestype         => "Symbol. This is the identifier of the type of visualization for this series. Choose from $(_allTypes) or any series recipes which are defined.",
    :linestyle          => "Symbol. Style of the line (for path and bar stroke).  Choose from $(_allStyles)",
    :linewidth          => "Number. Width of the line (in pixels)",
    :linecolor          => "Color Type. Color of the line (for path and bar stroke).  `:match` will take the value from `:seriescolor`, (though histogram/bar types use `:black` as a default).",
    :linealpha          => "Number in [0,1]. The alpha/opacity override for the line.  `nothing` (the default) means it will take the alpha value of linecolor.",
    :fillrange          => "Number or AbstractVector.  Fills area between fillrange and y for line-types, sets the base for bar/stick types, and similar for other types.",
    :fillcolor          => "Color Type. Color of the filled area of path or bar types.  `:match` will take the value from `:seriescolor`.",
    :fillalpha          => "Number in [0,1]. The alpha/opacity override for the fill area.  `nothing` (the default) means it will take the alpha value of fillcolor.",
    :markershape        => "Symbol, Shape, or AbstractVector. Choose from $(_allMarkers).",
    :fillstyle          => "Symbol. Style of the fill area. `nothing` (the default) means solid fill. Choose from :/, :\\, :|, :-, :+, :x",
    :markercolor        => "Color Type. Color of the interior of the marker or shape. `:match` will take the value from `:seriescolor`.",
    :markeralpha        => "Number in [0,1]. The alpha/opacity override for the marker interior.  `nothing` (the default) means it will take the alpha value of markercolor.",
    :markersize         => "Number or AbstractVector. Size (radius pixels) of the markers",
    :markerstrokestyle  => "Symbol. Style of the marker stroke (border).  Choose from $(_allStyles)",
    :markerstrokewidth  => "Number. Width of the marker stroke (border) in pixels",
    :markerstrokecolor  => "Color Type. Color of the marker stroke (border).  `:match` will take the value from `:foreground_color_subplot`.",
    :markerstrokealpha  => "Number in [0,1]. The alpha/opacity override for the marker stroke (border).  `nothing` (the default) means it will take the alpha value of markerstrokecolor.",
    :bins               => "Integer, NTuple{2,Integer}, AbstractVector or Symbol. Default is :auto (the Freedman-Diaconis rule). For histogram-types, defines the approximate number of bins to aim for, or the auto-binning algorithm to use (:sturges, :sqrt, :rice, :scott or :fd). For fine-grained control pass a Vector of break values, e.g. `range(minimum(x), stop = maximum(x), length = 25)`",
    :smooth             => "Bool.  Add a regression line?",
    :group              => "AbstractVector. Data is split into a separate series, one for each unique value in `group`",
    :x                  => "Various. Input data. First Dimension",
    :y                  => "Various. Input data. Second Dimension",
    :z                  => "Various. Input data. Third Dimension. May be wrapped by a `Surface` for surface and heatmap types.",
    :marker_z           => "AbstractVector, Function `f(x,y,z) -> z_value`, or Function `f(x,y) -> z_value`, or nothing. z-values for each series data point, which correspond to the color to be used from a markercolor gradient.",
    :line_z             => "AbstractVector, Function `f(x,y,z) -> z_value`, or Function `f(x,y) -> z_value`, or nothing. z-values for each series line segment, which correspond to the color to be used from a linecolor gradient.  Note that for N points, only the first N-1 values are used (one per line-segment).",
    :fill_z             => "Matrix{Float64} of the same size as z matrix, which specifies the color of the 3D surface; the default value is `nothing`.",
    :levels             => "Integer (number of contours) or AbstractVector (contour values). Determines contour levels for a contour type.",
    :orientation        => "Symbol.  Horizontal or vertical orientation for bar types.  Values `:h`, `:hor`, `:horizontal` correspond to horizontal (sideways, anchored to y-axis), and `:v`, `:vert`, and `:vertical` correspond to vertical (the default).",
    :bar_position       => "Symbol.  Choose from `:overlay` (default), `:stack`.  (warning: May not be implemented fully)",
    :bar_width          => "nothing or Number. Width of bars in data coordinates. When nothing, chooses based on x (or y when `orientation = :h`).",
    :bar_edges          => "Bool.  Align bars to edges (true), or centers (the default)?",
    :xerror             => "AbstractVector or 2-Tuple of Vectors. x (horizontal) error relative to x-value.  If 2-tuple of vectors, the first vector corresponds to the left error (and the second to the right)",
    :yerror             => "AbstractVector or 2-Tuple of Vectors. y (vertical) error relative to y-value.  If 2-tuple of vectors, the first vector corresponds to the bottom error (and the second to the top)",
    :ribbon             => "Number or AbstractVector.  Creates a fillrange around the data points.",
    :quiver             => "AbstractVector or 2-Tuple of vectors.  The directional vectors U,V which specify velocity/gradient vectors for a quiver plot.",
    :arrow              => "nothing (no arrows), Bool (if true, default arrows), Arrow object, or arg(s) that could be style or head length/widths.  Defines arrowheads that should be displayed at the end of path line segments (just before a NaN and the last non-NaN point).  Used in quiverplot, streamplot, or similar.",
    :normalize          => "Bool or Symbol. Histogram normalization mode. Possible values are: false/:none (no normalization, default), true/:pdf (normalize to a discrete Probability Density Function, where the total area of the bins is 1), :probability (bin heights sum to 1) and :density (the area of each bin, rather than the height, is equal to the counts - useful for uneven bin sizes).",
    :weights            => "AbstractVector. Used in histogram types for weighted counts.",
    :show_empty_bins    => "Bool. Whether empty bins in a 2D histogram are colored as 0 (true), or transparent (the default)",
    :contours           => "Bool. Add contours to the side-grids of 3D plots?  Used in surface/wireframe.",
    :contour_labels     => "Bool. Show labels at the contour lines?",
    :match_dimensions   => "Bool. For heatmap types... should the first dimension of a matrix (rows) correspond to the first dimension of the plot (x-axis)?  The default is false, which matches the behavior of Matplotlib, Plotly, and others.  Note: when passing a function for z, the function should still map `(x,y) -> z`.",
    :subplot            => "Integer (subplot index) or Subplot object.  The subplot that this series belongs to.",
    :series_annotations => "AbstractVector of String or PlotText.  These are annotations which are mapped to data points/positions.",
    :primary            => "Bool.  Does this count as a 'real series'?  For example, you could have a path (primary), and a scatter (secondary) as 2 separate series, maybe with different data (see sticks recipe for an example).  The secondary series will get the same color, etc as the primary.",
    :hover              => "nothing or vector of strings. Text to display when hovering over each data point.",
    :colorbar_entry     => "Bool.  Include this series in the color bar?  Set to `false` to exclude.",

    # plot args
    :plot_title               => "String. Title for the whole plot (not the subplots)",
    :plot_titlevspan          => "Number in [0,1]. Vertical span of the whole plot title (fraction of the plot height)",
    :background_color         => "Color Type.  Base color for all backgrounds.",
    :background_color_outside => "Color Type or `:match` (matches `:background_color`).  Color outside the plot area(s)",
    :foreground_color         => "Color Type.  Base color for all foregrounds.",
    :size                     => "NTuple{2,Int}. (width_px, height_px) of the whole Plot",
    :pos                      => "NTuple{2,Int}. (left_px, top_px) position of the GUI window (note: currently unimplemented)",
    :window_title             => "String. Title of the standalone gui-window.",
    :show                     => "Bool.  Should this command open/refresh a GUI/display?  This allows displaying in scripts or functions without explicitly calling `display`",
    :layout                   => "Integer (number of subplots), NTuple{2,Integer} (grid dimensions), AbstractLayout (for example `grid(2,2)`), or the return from the `@layout` macro.  This builds the layout of subplots.",
    :link                     => "Symbol.  How/whether to link axis limits between subplots. Values: `:none`, `:x` (x axes are linked by columns), `:y` (y axes are linked by rows), `:both` (x and y are linked), `:all` (every subplot is linked together regardless of layout position).",
    :overwrite_figure         => "Bool.  Should we reuse the same GUI window/figure when plotting (true) or open a new one (false).",
    :html_output_format       => "Symbol.  When writing html output, what is the format?  `:png` and `:svg` are currently supported.",
    :tex_output_standalone    => "Bool. When writing tex output, should the source include a preamble for a standalone document class.",
    :inset_subplots           => "nothing or vector of 2-tuple (parent,bbox).  optionally pass a vector of (parent,bbox) tuples which are the parent layout and the relative bounding box of inset subplots",
    :dpi                      => "Number.  Dots Per Inch of output figures",
    :thickness_scaling        => "Number. Scale for the thickness of all line elements like lines, borders, axes, grid lines, ... defaults to 1.",
    :display_type             => "Symbol (`:auto`, `:gui`, or `:inline`).  When supported, `display` will either open a GUI window or plot inline.",
    :extra_kwargs             => "Either one of (`:plot`, `:subplot`, `:series`) to specify for which element extra keyword args are collected or a KW (Dict{Symbol,Any}) to pass a map of extra keyword args which may be specific to a backend. Default: `:series`.\n Example: `pgfplotsx(); scatter(1:5, extra_kwargs=Dict(:subplot=>Dict(\"axis line shift\" => \"10pt\"))`",
    :fontfamily               => "String or Symbol.  Default font family for title, legend entries, tick labels and guides",
    :warn_on_unsupported      => "Bool. Warn on unsupported attributes, series types and marker shapes",

    # subplot args
    :title                    => "String. Subplot title.",
    :titlelocation            => "Symbol. Position of subplot title. Values: `:left`, `:center`, `:right`",
    :titlefontfamily          => "String or Symbol. Font family of subplot title.",
    :titlefontsize            => "Integer. Font pointsize of subplot title.",
    :titlefonthalign          => "Symbol. Font horizontal alignment of subplot title: :hcenter, :left, :right or :center",
    :titlefontvalign          => "Symbol. Font vertical alignment of subplot title: :vcenter, :top, :bottom or :center",
    :titlefontrotation        => "Real. Font rotation of subplot title",
    :titlefontcolor           => "Color Type. Font color of subplot title",
    :background_color_subplot => "Color Type or `:match` (matches `:background_color`).  Base background color of the subplot.",
    :background_color_legend  => "Color Type or `:match` (matches `:background_color_subplot`).  Background color of the legend.",
    :background_color_inside  => "Color Type or `:match` (matches `:background_color_subplot`).  Background color inside the plot area (under the grid).",
    :foreground_color_subplot => "Color Type or `:match` (matches `:foreground_color`).  Base foreground color of the subplot.",
    :foreground_color_legend  => "Color Type or `:match` (matches `:foreground_color_subplot`).  Foreground color of the legend.",
    :foreground_color_title   => "Color Type or `:match` (matches `:foreground_color_subplot`). Color of subplot title.",
    :color_palette            => "Vector of colors (cycle through) or color gradient (generate list from gradient) or `:auto` (generate a color list using `Colors.distiguishable_colors` and custom seed colors chosen to contrast with the background).  The color palette is a color list from which series colors are automatically chosen.",
    :legend                   => "Bool (show the legend?) or (x,y) tuple or Symbol (legend position) or angle or (angle,inout) tuple. Bottom left corner of legend is placed at (x,y).  Symbol values: `:none`; `:best`; `:inline`; `:inside`; `:legend`; any valid combination of `:(outer ?)(top/bottom ?)(right/left ?)`, i.e.: `:top`, `:topright`, `:outerleft`, `:outerbottomright` ... (note: only some may be supported in each backend). Legend is positioned at (angle degrees) (so (90,:outer) is roughly equivalent to :outertop), close to the inside of the axes or the outside if inout=:outer.",
    :legendfontfamily         => "String or Symbol. Font family of legend entries.",
    :legendfontsize           => "Integer. Font pointsize of legend entries.",
    :legendfonthalign         => "Symbol. Font horizontal alignment of legend entries: :hcenter, :left, :right or :center",
    :legendfontvalign         => "Symbol. Font vertical alignment of legend entries: :vcenter, :top, :bottom or :center",
    :legendfontrotation       => "Real. Font rotation of legend entries",
    :legendfontcolor          => "Color Type. Font color of legend entries",
    :legendtitle              => "String. Legend title.",
    :legendtitlefontfamily    => "String or Symbol. Font family of the legend title.",
    :legendtitlefontsize      => "Integer. Font pointsize the legend title.",
    :legendtitlefonthalign    => "Symbol. Font horizontal alignment of the legend title: :hcenter, :left, :right or :center",
    :legendtitlefontvalign    => "Symbol. Font vertical alignment of the legend title: :vcenter, :top, :bottom or :center",
    :legendtitlefontrotation  => "Real. Font rotation of the legend title",
    :legendtitlefontcolor     => "Color Type. Font color of the legend title",
    :colorbar                 => "Bool (show the colorbar?) or Symbol (colorbar position).  Symbol values: `:none`, `:best`, `:right`, `:left`, `:top`, `:bottom`, `:legend` (matches legend value) (note: only some may be supported in each backend)",
    :clims                    => "`:auto`, NTuple{2,Number}, or a function that takes series data in and returns NTuple{2,Number}.  Fixes the limits of the colorbar.",
    :colorbar_fontfamily      => "String or Symbol. Font family of colobar entries.",
    :colorbar_ticks           => "Vector of numbers (set the tick values), Tuple of (tickvalues, ticklabels), or `:auto`",
    :colorbar_tickfontfamily  => "String or Symbol. Font family of colorbar tick labels.",
    :colorbar_tickfontsize    => "Integer. Font pointsize of colorbar tick entries.",
    :colorbar_tickfontcolor   => "Color Type. Font color of colorbar tick entries",
    :colorbar_scale           => "Symbol. Scale of the colorbar axis: `:none`, `:ln`, `:log2`, `:log10`",
    :colorbar_formatter       => "Function, :scientific, :plain or :auto. A method which converts a number to a string for tick labeling.",
    :legendfont               => "Font. Font of legend items.",
    :legendtitlefont          => "Font. Font of the legend title.",
    :annotations              => "(x,y,text) tuple(s).  Can be a single tuple or a list of them.  Text can be String, PlotText (created with `text(args...)`), or a tuple of arguments to `text` (e.g., `(\"Label\", 8, :red, :top)`).  Add one-off text annotations at the x,y coordinates.",
    :annotationfontfamily     => "String or Symbol. Font family of annotations.",
    :annotationfontsize       => "Integer. Font pointsize of annotations.",
    :annotationhalign         => "Symbol. horizontal alignment of annotations, :hcenter, :left, :right or :center.",
    :annotationvalign         => "Symbol. Vertical alignment of annotations, :vcenter, :top, :bottom or :center.",
    :annotationrotation       => "Float. Rotation of annotations in degrees.",
    :annotationcolor          => "Colorant or :match. Color of annotations.",
    :projection               => "Symbol or String.  '3d' or 'polar'",
    :aspect_ratio             => "Symbol (:equal or :none) or Number. Plot area is resized so that 1 y-unit is the same size as `aspect_ratio` x-units. With `:none`, images inherit aspect ratio of the plot area.",
    :margin                   => "Measure (multiply by `mm`, `px`, etc). Base for individual margins... not directly used.  Specifies the extra padding around subplots.",
    :left_margin              => "Measure (multiply by `mm`, `px`, etc) or `:match` (matches `:margin`).  Specifies the extra padding to the left of the subplot.",
    :top_margin               => "Measure (multiply by `mm`, `px`, etc) or `:match` (matches `:margin`).  Specifies the extra padding on the top of the subplot.",
    :right_margin             => "Measure (multiply by `mm`, `px`, etc) or `:match` (matches `:margin`).  Specifies the extra padding to the right of the subplot.",
    :bottom_margin            => "Measure (multiply by `mm`, `px`, etc) or `:match` (matches `:margin`).  Specifies the extra padding on the bottom of the subplot.",
    :subplot_index            => "Integer.  Internal (not set by user).  Specifies the index of this subplot in the Plot's `plt.subplot` list.",
    :colorbar_title           => "String.  Title of colorbar.",
    :framestyle               => "Symbol.  Style of the axes frame. Choose from $(_allFramestyles)",
    :camera                   => "NTuple{2, Real}. Sets the view angle (azimuthal, elevation) for 3D plots",

    # axis args
    :guide                       => "String. Axis guide (label).",
    :guide_position              => "Symbol. Position of axis guides: :top, :bottom, :left or :right",
    :lims                        => """
                                    NTuple{2,Number} or Symbol. Force axis limits. Only finite values are used (you can set only the right limit with `xlims = (-Inf, 2)` for example).
                                    `:round` widens the limit to the nearest round number ie. [0.1,3.6]=>[0.0,4.0]
                                    `:symmetric` sets the limits to be symmetric around zero.
                                    Set widen=true to widen the specified limits (as occurs when lims are not specified).
                                    """,
    :ticks                       => "Vector of numbers (set the tick values), Tuple of (tickvalues, ticklabels), or `:auto`",
    :scale                       => "Symbol. Scale of the axis: `:none`, `:ln`, `:log2`, `:log10`",
    :rotation                    => "Number. Degrees rotation of tick labels.",
    :flip                        => "Bool.  Should we flip (reverse) the axis?",
    :formatter                   => "Function, :scientific, :plain or :auto. A method which converts a number to a string for tick labeling.",
    :tickfontfamily              => "String or Symbol. Font family of tick labels.",
    :tickfontsize                => "Integer. Font pointsize of tick labels.",
    :tickfonthalign              => "Symbol. Font horizontal alignment of tick labels: :hcenter, :left, :right or :center",
    :tickfontvalign              => "Symbol. Font vertical alignment of tick labels: :vcenter, :top, :bottom or :center",
    :tickfontrotation            => "Real. Font rotation of tick labels",
    :tickfontcolor               => "Color Type. Font color of tick labels",
    :guidefontfamily             => "String or Symbol. Font family of axes guides.",
    :guidefontsize               => "Integer. Font pointsize of axes guides.",
    :guidefonthalign             => "Symbol. Font horizontal alignment of axes guides: :hcenter, :left, :right or :center",
    :guidefontvalign             => "Symbol. Font vertical alignment of axes guides: :vcenter, :top, :bottom or :center",
    :guidefontrotation           => "Real. Font rotation of axes guides",
    :guidefontcolor              => "Color Type. Font color of axes guides",
    :foreground_color_axis       => "Color Type or `:match` (matches `:foreground_color_subplot`). Color of axis ticks.",
    :foreground_color_border     => "Color Type or `:match` (matches `:foreground_color_subplot`). Color of plot area border (spines).",
    :foreground_color_text       => "Color Type or `:match` (matches `:foreground_color_subplot`). Color of tick labels.",
    :foreground_color_guide      => "Color Type or `:match` (matches `:foreground_color_subplot`). Color of axis guides (axis labels).",
    :mirror                      => "Bool.  Switch the side of the tick labels (right or top).",
    :grid                        => "Bool, Symbol, String or `nothing`. Show the grid lines? `true`, `false`, `:show`, `:hide`, `:yes`, `:no`, `:x`, `:y`, `:z`, `:xy`, ..., `:all`, `:none`, `:off`",
    :foreground_color_grid       => "Color Type or `:match` (matches `:foreground_color_subplot`). Color of grid lines.",
    :gridalpha                   => "Number in [0,1]. The alpha/opacity override for the grid lines.",
    :gridstyle                   => "Symbol. Style of the grid lines. Choose from $(_allStyles)",
    :gridlinewidth               => "Number. Width of the grid lines (in pixels)",
    :foreground_color_minor_grid => "Color Type or `:match` (matches `:foreground_color_subplot`). Color of minor grid lines.",
    :minorgrid                   => "Bool. Adds minor grid lines and ticks to the plot. Set minorticks to change number of gridlines",
    :minorticks                  => "Integer. Intervals to divide the gap between major ticks into",
    :minorgridalpha              => "Number in [0,1]. The alpha/opacity override for the minorgrid lines.",
    :minorgridstyle              => "Symbol. Style of the minor grid lines. Choose from $(_allStyles)",
    :minorgridlinewidth          => "Number. Width of the minor grid lines (in pixels)",
    :tick_direction              => "Symbol.  Direction of the ticks. `:in`, `:out` or `:none`",
    :showaxis                    => "Bool, Symbol or String.  Show the axis. `true`, `false`, `:show`, `:hide`, `:yes`, `:no`, `:x`, `:y`, `:z`, `:xy`, ..., `:all`, `:off`",
    :widen                       => """
                                    Bool or :auto. Widen the axis limits by a small factor to avoid cut-off markers and lines at the borders.
                                    Defaults to `:auto`, which widens unless limits were manually set.
                                    """,
    :draw_arrow                  => "Bool. Draw arrow at the end of the axis.",
)
