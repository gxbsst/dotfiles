black = "#2e3440"
white = "#e5e9f0"
grey = "#d8dee9"
red = "#bf616a"
frost_green = "#8fbcbb"
cyan = "#88c0d0"
green = "#a3be8c"
yellow = "#ebcb8b"
blue = "#81a1c1"
magenta = "#b48ead"
orange = "#d08770"

EMPTY_WORKSPACE = [
    "🍻",
    "No workspaces yet?",
    f"Press [{cyan}]'a'[/{cyan}] to add some!",
] # Message to show when there are no workspaces, it's a list of renderable and works just like DASHBOARD 

WORKSPACE =  {
    "dim": grey, # style/color for unfocused items
    "highlight": white, # style/color for a focused item when not editing
    "editing": cyan, # style/color for a focused item when editing
    "pointer": "> ", # A pointer to show the cursor position

     # text to show if there are children workspaces
     # You can use some vars for hint
     # VARS
     # count: number of children inside workspace 
     # You can use this in 2 different ways
     # Example 1: This will indicate that the workspaces has additional child workspaces
    # Example 2: This will indicate the presence of children along with count
     "children_hint": "+{count}", 
}

COLUMN_ORDER = ["description", "due", "urgency"]  # order of columns for todo pane
TODO = {
    "color_todos": False, # this will color the todos based on their status (overdue: red, pending: yellow, done:green)
    "dim": grey, # style/color for unfocused todo
    "highlight": white, # style/color for focused todo when not editing
    "editing": cyan, # style/color for focused todo when not editing
    "pointer": "> ", # cursor pointer
    "due_icon": "🕑", # icon to use for due
    "effort_icon": "🗲 ", # icon to use for effort
    "effort_color": yellow, # color to use for effort
    "recurrence_icon": " ⟲ ", # icon to use for recurrence
    "recurrence_color": blue, # color to use for recurrence
    "tags_icon": "🖈 ", # icon to use for tags
    "tags_seperator": "icon",  # seperator for multiple tags (Options: icon, pipe, comma)
    "tags_color": red, # color for tags
    "completed_icon": "✓ ", # icon for completed todo
    "pending_icon": "● ", # icon for pending todo
    "overdue_icon": "! ", # icon for overdue todo
    "urgency1_icon": "🅐", # icon for urgency 1 (lowest)
    "urgency2_icon": "🅑", 
    "urgency3_icon": "🅒",
    "urgency4_icon": "🅓",
    
    # See workspace children hint for details
    # VARS
    # remaining: Todos remaining
    # done     : Todos done 
    # total    : Total todos
    "children_hint": "({done}/{total})"
}

EMPTY_TODO = [
    "🤘",
    "Wow so Empty!?",
    "Add some todos to get started!",
]
