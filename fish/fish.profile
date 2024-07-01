Time	Sum	Command
363	3997	> builtin source /usr/share/fish/config.fish
16	16	-> set -g IFS \n\ \t
3	3	-> set -qg __fish_added_user_paths
3	3	-> set -g __fish_added_user_paths
3	3	-> function __fish_default_command_not_found_handler...
0	4	-> if not status --is-interactive...
4	4	--> not status --is-interactive
3	3	-> set -l __extra_completionsdir
3	3	-> set -l __extra_functionsdir
3	3	-> set -l __extra_confdir
4	59	-> if test -f $__fish_data_dir/__fish_build_paths.fish...
16	16	--> test -f $__fish_data_dir/__fish_build_paths.fish
28	39	--> source $__fish_data_dir/__fish_build_paths.fish
5	5	---> set __extra_completionsdir /usr/share/fish/vendor_completions.d
3	3	---> set __extra_functionsdir /usr/share/fish/vendor_functions.d
3	3	---> set __extra_confdir /usr/share/fish/vendor_conf.d
3	3	-> set -l xdg_data_dirs
5	302	-> if set -q XDG_DATA_DIRS...
2	2	--> set -q XDG_DATA_DIRS
6	6	--> set --path xdg_data_dirs $XDG_DATA_DIRS
196	289	--> set xdg_data_dirs (string replace -r '([^/])/$' '$1' -- $xdg_data_dirs)/fish
93	93	---> string replace -r '([^/])/$' '$1' -- $xdg_data_dirs
17	17	-> set -g __fish_vendor_completionsdirs
7	7	-> set -g __fish_vendor_functionsdirs
6	6	-> set -g __fish_vendor_confdirs
13	110	-> if not set -q FISH_UNIT_TESTS_RUNNING...
5	5	--> not set -q FISH_UNIT_TESTS_RUNNING
19	19	--> set __fish_vendor_completionsdirs $__fish_user_data_dir/vendor_completions.d $xdg_data_dirs/vendor_completions.d
15	15	--> set __fish_vendor_functionsdirs $__fish_user_data_dir/vendor_functions.d $xdg_data_dirs/vendor_functions.d
13	13	--> set __fish_vendor_confdirs $__fish_user_data_dir/vendor_conf.d $xdg_data_dirs/vendor_conf.d
2	20	--> if not contains -- $__extra_completionsdir $__fish_vendor_completionsdirs...
18	18	---> not contains -- $__extra_completionsdir $__fish_vendor_completionsdirs
1	13	--> if not contains -- $__extra_functionsdir $__fish_vendor_functionsdirs...
12	12	---> not contains -- $__extra_functionsdir $__fish_vendor_functionsdirs
1	12	--> if not contains -- $__extra_confdir $__fish_vendor_confdirs...
11	11	---> not contains -- $__extra_confdir $__fish_vendor_confdirs
7	33	-> if not set -q fish_function_path...
5	5	--> not set -q fish_function_path
21	21	--> set fish_function_path $__fish_config_dir/functions $__fish_sysconf_dir/functions $__fish_vendor_functionsdirs $__fish_data_dir/functions
5	32	-> if not set -q fish_complete_path...
5	5	--> not set -q fish_complete_path
22	22	--> set fish_complete_path $__fish_config_dir/completions $__fish_sysconf_dir/completions $__fish_vendor_completionsdirs $__fish_data_dir/completions $__fish_user_data_dir/generated_completions
9	9	-> function __fish_reconstruct_path -d "Update PATH when fish_user_paths changes" --on-variable fish_user_paths...
15	15	-> function fish_sigtrap_handler --on-signal TRAP --no-scope-shadowing --description "TRAP handler: debug prompt"...
5	5	-> function __fish_on_interactive --on-event fish_prompt --on-event fish_read...
184	663	-> __fish_set_locale
390	395	--> source /usr/share/fish/functions/__fish_set_locale.fish
5	5	---> function __fish_set_locale...
13	13	--> set -l LOCALE_VARS
11	11	--> set -a LOCALE_VARS LANG LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE
8	8	--> set -a LOCALE_VARS LC_MONETARY LC_MESSAGES LC_PAPER LC_NAME LC_ADDRESS
8	8	--> set -a LOCALE_VARS LC_TELEPHONE LC_MEASUREMENT LC_IDENTIFICATION
26	44	--> for locale_var in $LOCALE_VARS LC_ALL...
5	18	---> if set -q $locale_var...
8	8	----> set -q $locale_var
5	5	----> return 0
2	7	-> if status --is-login...
5	5	--> status --is-login
15	928	-> __fish_reconstruct_path
7	7	--> set -l new_user_path
141	209	--> for path in (string split : -- $fish_user_paths)...
26	26	---> string split : -- $fish_user_paths
3	32	---> if not contains -- $path $new_user_path...
23	23	----> not contains -- $path $new_user_path
6	6	----> set -a new_user_path $path
2	10	---> if not contains -- $path $new_user_path...
4	4	----> not contains -- $path $new_user_path
4	4	----> set -a new_user_path $path
2	246	--> if test (count $new_user_path) -lt (count $fish_user_paths)...
193	244	---> test (count $new_user_path) -lt (count $fish_user_paths)
40	40	----> count $new_user_path
11	11	----> count $fish_user_paths
22	22	--> set -l local_path $PATH
5	5	--> for x in $__fish_added_user_paths...
4	4	--> set -g __fish_added_user_paths
3	401	--> if set -q fish_user_paths...
2	2	---> set -q fish_user_paths
101	396	---> for x in (string split ":" -- $fish_user_paths[-1..1])...
14	14	----> string split ":" -- $fish_user_paths[-1..1]
4	135	----> if set -l idx (contains --index -- $x $local_path)...
97	122	-----> set -l idx (contains --index -- $x $local_path)
25	25	------> contains --index -- $x $local_path
9	9	-----> set -e local_path[$idx]
9	9	----> set -p local_path $x
4	131	----> if set -l idx (contains --index -- $x $local_path)...
96	119	-----> set -l idx (contains --index -- $x $local_path)
23	23	------> contains --index -- $x $local_path
8	8	-----> set -e local_path[$idx]
6	6	----> set -p local_path $x
19	19	--> set -xg PATH $local_path
2	2	-> function __fish_expand_pid_args...
5	14	-> for jobbltn in bg wait disown...
3	3	--> function $jobbltn -V jobbltn...
3	3	--> function $jobbltn -V jobbltn...
3	3	--> function $jobbltn -V jobbltn...
1	1	-> function fg...
1	1	-> function kill...
3	3	-> set -l sourcelist
74	1379	-> for file in $__fish_config_dir/conf.d/*.fish $__fish_sysconf_dir/conf.d/*.fish $__fish_vendor_confdirs/*.fish...
103	123	--> set -l basename (string replace -r '^.*/' '' -- $file)
20	20	---> string replace -r '^.*/' '' -- $file
7	7	--> contains -- $basename $sourcelist
5	5	--> set sourcelist $sourcelist $basename
14	14	--> test -f $file -a -r $file
56	517	--> source $file
1	5	---> if not status is-interactive...
4	4	----> not status is-interactive
5	5	---> set --global _fzf_search_vars_command '_fzf_search_variables (set --show | psub) (set --names | psub)'
24	448	---> fzf_configure_bindings
108	113	----> source /home/nagashima/.config/fish/functions/fzf_configure_bindings.fish
5	5	-----> function fzf_configure_bindings --description "Installs the default key bindings for fzf.fish with user overrides passed as options."...
3	3	----> status is-interactive
8	8	----> set -f options_spec h/help 'directory=?' 'git_log=?' 'git_status=?' 'history=?' 'processes=?' 'variables=?'
19	19	----> argparse --max-args=0 --ignore-unknown $options_spec -- $argv 2>/dev/null
12	281	----> if test $status -ne 0...
6	6	-----> test $status -ne 0
2	2	-----> set --query _flag_help
7	7	-----> set -f key_sequences \e\cf \e\cl \e\cs \cr \e\cp \cv
2	2	-----> set --query _flag_directory
1	1	-----> set --query _flag_git_log
2	2	-----> set --query _flag_git_status
2	2	-----> set --query _flag_history
1	1	-----> set --query _flag_processes
2	2	-----> set --query _flag_variables
3	112	-----> if functions --query _fzf_uninstall_bindings...
109	109	------> functions --query _fzf_uninstall_bindings
21	129	-----> for mode in default insert...
8	8	------> test -n $key_sequences[1]
18	18	------> bind --mode $mode $key_sequences[1] _fzf_search_directory
3	3	------> test -n $key_sequences[2]
5	5	------> bind --mode $mode $key_sequences[2] _fzf_search_git_log
3	3	------> test -n $key_sequences[3]
4	4	------> bind --mode $mode $key_sequences[3] _fzf_search_git_status
2	2	------> test -n $key_sequences[4]
4	4	------> bind --mode $mode $key_sequences[4] _fzf_search_history
3	3	------> test -n $key_sequences[5]
4	4	------> bind --mode $mode $key_sequences[5] _fzf_search_processes
2	2	------> test -n $key_sequences[6]
6	6	------> bind --mode $mode $key_sequences[6] "$_fzf_search_vars_command"
3	3	------> test -n $key_sequences[1]
5	5	------> bind --mode $mode $key_sequences[1] _fzf_search_directory
3	3	------> test -n $key_sequences[2]
4	4	------> bind --mode $mode $key_sequences[2] _fzf_search_git_log
3	3	------> test -n $key_sequences[3]
6	6	------> bind --mode $mode $key_sequences[3] _fzf_search_git_status
3	3	------> test -n $key_sequences[4]
5	5	------> bind --mode $mode $key_sequences[4] _fzf_search_history
3	3	------> test -n $key_sequences[5]
4	4	------> bind --mode $mode $key_sequences[5] _fzf_search_processes
2	2	------> test -n $key_sequences[6]
5	5	------> bind --mode $mode $key_sequences[6] "$_fzf_search_vars_command"
3	3	-----> function _fzf_uninstall_bindings --inherit-variable key_sequences...
3	3	---> function _fzf_uninstall --on-event fzf_uninstall...
127	144	--> set -l basename (string replace -r '^.*/' '' -- $file)
17	17	---> string replace -r '^.*/' '' -- $file
8	8	--> contains -- $basename $sourcelist
5	5	--> set sourcelist $sourcelist $basename
12	12	--> test -f $file -a -r $file
19	73	--> source $file
37	54	---> . "$HOME/.cargo/env.fish"
1	17	----> if not contains "$HOME/.cargo/bin" $PATH...
16	16	-----> not contains "$HOME/.cargo/bin" $PATH
123	140	--> set -l basename (string replace -r '^.*/' '' -- $file)
17	17	---> string replace -r '^.*/' '' -- $file
8	8	--> contains -- $basename $sourcelist
6	6	--> set sourcelist $sourcelist $basename
12	12	--> test -f $file -a -r $file
63	231	--> source $file
6	6	---> set -ul snap_bin_path "/snap/bin"
1	15	---> if not contains $snap_bin_path $PATH...
14	14	----> not contains $snap_bin_path $PATH
3	3	---> set -ul snap_xdg_path /var/lib/snapd/desktop
1	3	---> if not set -q XDG_DATA_DIRS...
2	2	----> not set -q XDG_DATA_DIRS
2	141	---> if not contains $snap_xdg_path (string split : "$XDG_DATA_DIRS")...
126	139	----> not contains $snap_xdg_path (string split : "$XDG_DATA_DIRS")
13	13	-----> string split : "$XDG_DATA_DIRS"
16	16	> builtin source /etc/fish/config.fish
25	389	> builtin source /home/nagashima/.config/fish/config.fish
3	364	-> if status is-interactive...
3	3	--> status is-interactive
14	53	--> functions -q nodenv
35	39	---> source /home/nagashima/.config/fish/functions/nodenv.fish
2	2	----> function nodenv...
1	1	----> function node...
1	1	----> function npm...
4	4	--> functions -e nodenv
39	44	--> source ~/.config/fish/functions/nodenv.fish
1	1	---> function nodenv...
1	1	---> function node...
3	3	---> function npm...
34	38	--> source ~/.config/fish/functions/pyenv.fish
2	2	---> function pyenv...
1	1	---> function python...
1	1	---> function pip...
11	219	--> fzf_configure_bindings --directory=\cf
2	2	---> status is-interactive
10	10	---> set -f options_spec h/help 'directory=?' 'git_log=?' 'git_status=?' 'history=?' 'processes=?' 'variables=?'
20	20	---> argparse --max-args=0 --ignore-unknown $options_spec -- $argv 2>/dev/null
10	176	---> if test $status -ne 0...
5	5	----> test $status -ne 0
2	2	----> set --query _flag_help
7	7	----> set -f key_sequences \e\cf \e\cl \e\cs \cr \e\cp \cv
2	2	----> set --query _flag_directory
5	5	----> set key_sequences[1] "$_flag_directory"
3	3	----> set --query _flag_git_log
2	2	----> set --query _flag_git_status
2	2	----> set --query _flag_history
2	2	----> set --query _flag_processes
2	2	----> set --query _flag_variables
2	26	----> if functions --query _fzf_uninstall_bindings...
4	4	-----> functions --query _fzf_uninstall_bindings
5	20	-----> _fzf_uninstall_bindings
8	8	------> bind --erase -- $key_sequences
7	7	------> bind --erase --mode insert -- $key_sequences
15	105	----> for mode in default insert...
4	4	-----> test -n $key_sequences[1]
5	5	-----> bind --mode $mode $key_sequences[1] _fzf_search_directory
2	2	-----> test -n $key_sequences[2]
5	5	-----> bind --mode $mode $key_sequences[2] _fzf_search_git_log
3	3	-----> test -n $key_sequences[3]
4	4	-----> bind --mode $mode $key_sequences[3] _fzf_search_git_status
3	3	-----> test -n $key_sequences[4]
4	4	-----> bind --mode $mode $key_sequences[4] _fzf_search_history
2	2	-----> test -n $key_sequences[5]
4	4	-----> bind --mode $mode $key_sequences[5] _fzf_search_processes
3	3	-----> test -n $key_sequences[6]
6	6	-----> bind --mode $mode $key_sequences[6] "$_fzf_search_vars_command"
3	3	-----> test -n $key_sequences[1]
5	5	-----> bind --mode $mode $key_sequences[1] _fzf_search_directory
3	3	-----> test -n $key_sequences[2]
5	5	-----> bind --mode $mode $key_sequences[2] _fzf_search_git_log
3	3	-----> test -n $key_sequences[3]
4	4	-----> bind --mode $mode $key_sequences[3] _fzf_search_git_status
3	3	-----> test -n $key_sequences[4]
4	4	-----> bind --mode $mode $key_sequences[4] _fzf_search_history
2	2	-----> test -n $key_sequences[5]
4	4	-----> bind --mode $mode $key_sequences[5] _fzf_search_processes
3	3	-----> test -n $key_sequences[6]
6	6	-----> bind --mode $mode $key_sequences[6] "$_fzf_search_vars_command"
3	3	----> function _fzf_uninstall_bindings --inherit-variable key_sequences...
