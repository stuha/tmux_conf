#!/usr/bin/env bash

#
# The tmux configurations of Jason Wang, simple and strong.
# All functions bind for tmux run-shell
#

# Restore the default tmux environment based on tmux-resurrect
res_def() {
    cd ~/.tmux/resurrect

    # Back up the last environment and use my default environment
    [[ -f last ]] && mv last last.bak
    ln -s ../default.env last
    ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh

    # Call the last environment back
    [[ -f last.bak ]] && mv last.bak last || rm last
}

# Show the quick reference
tmux_help() {
    cat << EOF
The default command key bindings are (including changes):
     C-x         Send the prefix key (C-x) through to the application.
     C-o         Rotate the panes in the current window forwards.
     C-z         Suspend the tmux client.
     C-r         Restore session
     C-s         Save session
     C-h         Show the quick reference
     I           Install plugins
     U           Uninstall
     H           Show tmux manual
     C           Kill the current window.
     x           Kill the current pane.
     X           Kill the current session.
     !           Break the current pane out of the window.
     _           Split the current pane into two, top and bottom.
     |           Split the current pane into two, left and right.
     #           List all paste buffers.
     $           Rename the current session.
     '           Prompt for a window index to select.
     (           Switch the attached client to the previous session.
     )           Switch the attached client to the next session.
     ,           Rename the current window.
     -           Delete the most recently copied buffer of text.
     .           Prompt for an index to move the current window.
     0 to 9      Select windows 0 to 9.
     :           Enter the tmux command prompt.
     ;           Move to the previously active pane.
     V           Choose which buffer to paste interactively from a list.
     ?           List all key bindings.
     D           Choose a client to detach.
     L           Switch the attached client back to the last session.
     [           Enter copy mode to copy text or view the history.
     ]           Paste the most recently copied buffer of text.
     c           Create a new window.
     d           Detach the current client.
     f           Prompt to search for text in open windows.
     i           Display some information about the current window.
     l           Move to the previously selected window.
     n           Change to the next window.
     o           Select the next pane in the current window.
     p           Change to the previous window.
     q           Briefly display pane indexes.
     r           Force redraw of the attached client.
     m           Mark the current pane (see select-pane -m).
     M           Clear the marked pane.
     s           Select a new session for the attached client interactively.
     t           Show the time.
     w           Choose the current window interactively.
     z           Toggle zoom state of the current pane.
     {           Swap the current pane with the previous pane.
     }           Swap the current pane with the next pane.
     ~           Show previous messages from tmux, if any.
     Page Up     Enter copy mode and scroll one page up.
     Up, Down
     Left, Right
     Change to the pane above, below, to the left, or to the right of the current pane.
     M-1 to M-5  Arrange panes in one of the five preset layouts: even-horizontal, even-vertical, main-hori‐
     zontal, main-vertical, or tiled.
     Space       Arrange the current window in the next preset layout.
     M-n         Move to the next window with a bell or activity marker.
     M-o         Rotate the panes in the current window backwards.
     M-p         Move to the previous window with a bell or activity marker.
     C-Up, C-Down
     C-Left, C-Right
     Resize the current pane in steps of one cell.
     M-Up, M-Down
     M-Left, M-Right
     Resize the current pane in steps of five cells.


EOF
}

left_status_info() {
    awk -F= '/TION/ {print $2}' /etc/lsb-release | sed 's/"//g'
}

# Run the function what you want
$1
