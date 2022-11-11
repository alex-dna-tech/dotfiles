conky.config = {

	--Various settings
	background = true, 							-- forked to background
	cpu_avg_samples = 2,						-- The number of samples to average for CPU monitoring.
	diskio_avg_samples = 10,				-- The number of samples to average for disk I/O monitoring.
	double_buffer = true,						-- Use the Xdbe extension? (eliminates flicker)
	if_up_strictness = 'address',		-- how strict if testing interface is up - up, link or address
	net_avg_samples = 2,						-- The number of samples to average for net data
	no_buffers = true,							-- Subtract (file system) buffers from used memory?
	temperature_unit = 'celsius',		-- fahrenheit or celsius
	text_buffer_size = 2048,				-- size of buffer for display of content of large variables - default 256
	update_interval = 1,						-- update interval
	imlib_cache_size = 0,           -- disable image cache to get a new spotify cover per song


	--Placement
	alignment = 'middle_right',			-- top-left,top-middle,top-right,bottom-left,bottom-middle,bottom-right,
                                  -- middle-left,middle-middle,middle-right,none
	--Duoscreen
	--gap_x = -1910,
	gap_x = 60,									    -- pixels between right or left border
	gap_y = 60,									    -- pixels between bottom or left border
	minimum_height = 400,						-- minimum height of window
	minimum_width = 180,						-- minimum height of window
	maximum_width = 560,						-- maximum height of window

	--Graphical
	border_inner_margin = 20, 					-- margin between border and text
	border_outer_margin = 20, 					-- margin between border and edge of window
	border_width = 0, 						   	-- border width in pixels
	default_bar_width = 280,					-- default is 0 - full width
	default_bar_height = 10,					-- default is 6
	default_gauge_height = 25,				-- default is 25
	default_gauge_width =40,					-- default is 40
	default_graph_height = 40,				-- default is 25
	default_graph_width = 153,				-- default is 0 - full width
	default_shade_color = '#000000',	-- default shading colour
	default_outline_color = '#000000',	-- default outline colour
	draw_borders = false,						  -- draw borders around text
	draw_graph_borders = true,				-- draw borders around graphs
	draw_shades = false,						  -- draw shades
	draw_outline = false,						  -- draw outline
	stippled_borders = 0,						  -- dashing the border

	--Textual
	extra_newline = false,						-- extra newline at the end - for asesome's wiboxes
	format_human_readable = true,			-- KiB, MiB rather then number of bytes
  font = 'Fira Code:size=12',       -- font for complete conky unless in code defined
	max_text_width = 0,							  -- 0 will make sure line does not get broken if width too smal
	max_user_text = 16384,						-- max text in conky default 16384
	override_utf8_locale = true,			-- force UTF8 requires xft
	short_units = true,							  -- shorten units from KiB to k
	top_name_width = 21,						  -- width for $top name value default 15
	top_name_verbose = false,					-- If true, top name shows the full command line of  each  process - Default value is false.
	uppercase = false,							  -- uppercase or not
	use_spacer = 'none',						  -- adds spaces around certain objects to align - default none
	use_xft = true,								    -- xft font - anti-aliased font
	xftalpha = 1,								      -- alpha of the xft font - between 0-1

	--Windows
	own_window = true,							  -- create your own window to draw
	own_window_argb_value = 120,		  -- real transparency - composite manager required 0-255
	own_window_argb_visual = true,		-- use ARGB - composite manager required
	own_window_class = 'Conky',				-- manually set the WM_CLASS name for use with xprop
	own_window_colour = '#000000',		-- set colour if own_window_transparent no
	own_window_hints = 'undecorated,below,above,sticky,skip_taskbar,skip_pager',  -- if own_window true - just hints - own_window_type sets it
	own_window_transparent = false,		-- if own_window_argb_visual is true sets background opacity 0%
	own_window_title = 'system_conky',	-- set the name manually  - default conky "hostname"
	own_window_type = 'override',			-- if own_window true options are: normal/override/dock/desktop/panel


	--Colours
	color1 = '#FFFFFF',
	color2 = '#FFA726',
	color3 = '#cccccc',
	color4 = '#BDBDBD',
	color5 = '#CCCCCC',
	color6 = '#aa0000',

	--Signal Colours
	color7 = '#1F7411',  						--green
	color8 = '#FFA726',  						--orange
	color9 = '#F1544B',  						--firebrick
}

conky.text = [[
${color1}Info:${color2} $sysname $nodename $kernel $machine
$hr
${color1}Uptime:${color2} $uptime
${color1}Frequency (in GHz):${color2} $freq_g
${color1}RAM:${color2} $mem/$memmax - $memperc% ${alignr}${membar 4}
${color1}Swap:${color2} $swap/$swapmax - $swapperc% ${alignr}${swapbar 4}
${color1}CPU:${color2} $cpu% ${alignr}${cpubar 4}
${color1}Processes:${color2} $processes  ${color1}Running:${color2} $running_processes
$hr
${color1}File systems:
 / ${color2}${fs_used /}/${fs_size /} ${alignr}${fs_bar 6 /}
${color1}Networking:
Up:${color2} ${upspeed} ${color1} - Down:${color2} ${downspeed}
$hr
${color2} Name                       ${alignr}PID   CPU%   MEM%
${color1} ${top name 1} ${alignr}${top pid 1} ${top cpu 1} ${top mem 1}
${color1} ${top name 2} ${alignr}${top pid 2} ${top cpu 2} ${top mem 2}
${color1} ${top name 3} ${alignr}${top pid 3} ${top cpu 3} ${top mem 3}
${color1} ${top name 4} ${alignr}${top pid 4} ${top cpu 4} ${top mem 4}
]]
