####
#
#   I keep a journal in text files.
#   This will be a simple way to create new entries, and list
#       what I already have.
#
#   TODO:
#   -   in create_entry, automatically enter the time in file
#   -   add an option to immediately go to and edit an entry
#       for any day
#
####


###### VARIABLES ######

JRNL_DIRECTORY="/home/austin/documents/journal"

YEAR="$(date +%Y)"

MONTH="$(date +%B | tr '[:upper:]' '[:lower:]')"

DAY="$(date +%d)"

###### FUNCTIONS ######

create_entry() {

    # directory template goes as follows:
    #   journal_directory/year/month/day.txt

    YEAR_DIR="$JRNL_DIRECTORY/$YEAR"
    
    # verify directory of year exists
    if [ ! -d "$YEAR_DIR" ]; then
        mkdir "$YEAR_DIR"
    fi
    
    MONTH_DIR="$YEAR_DIR/$MONTH"

    # verify directory of month exists
    if [ ! -d "$MONTH_DIR" ]; then
        mkdir "$MONTH_DIR"
    fi

    touch "$MONTH_DIR/$DAY.txt"

    vim "$MONTH_DIR/$DAY.txt" 
}

# TODO: make these pretty print in the proper month order
list_entries() {

    # I am not sure if there will be more here in the future
    # to make it look nicer, so I went ahead and wrapped this
    # in a function

    # ignore the "books" folder in journal
    ls -R --ignore="books"  "$JRNL_DIRECTORY"

}

###### MAIN ######

HELP="Bennett's own journal script.
usage:
    new     create a new entry
    list    list all entries
    help    display this message"

case $1 in
    
    new)
        create_entry
        ;;

    list)
        list_entries
        ;;

    help)
        echo "$HELP"
        ;;

    *)
        echo "$1    -- invalid option"
        echo "$HELP"
        ;;

esac 
