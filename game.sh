RESET=$'\033[0m'
BOLD=$'\033[1m'
DIM=$'\033[2m'
ITALIC=$'\033[3m'
UNDERLINE=$'\033[4m'
BLINK=$'\033[5m'
REVERSE=$'\033[7m'

BLACK=$'\033[30m'    RED=$'\033[31m'     GREEN=$'\033[32m'   YELLOW=$'\033[33m'
BLUE=$'\033[34m'     MAGENTA=$'\033[35m' CYAN=$'\033[36m'    WHITE=$'\033[37m'
ORANGE=$'\033[38;5;208m'

BRED=$'\033[91m'  BGREEN=$'\033[92m'  BYELLOW=$'\033[93m'
BBLUE=$'\033[94m' BMAGENTA=$'\033[95m' BCYAN=$'\033[96m'  BWHITE=$'\033[97m'


hour=6
minute=42
pmam="PM"

declare -A visited

visited[call_jake1]=false
visited[check_phone1]=false
visited[approach_biscuits1]=false
visited[watch_tv1]=false
visited[check_jake1]=false
visited[uncover_biscuit]=false
visited[search_biscuits1]=false
visited[call_bisky]=false
visited[call_mary1]=false
visited[bisky_confrontation]=false

advtime(){
    ((minute += $1))
    ((hour += minute / 60))
    ((minute %= 60))
    if (( hour > 12 )); then
        ((hour -= 12))
        [[ $pmam == "AM" ]] && pmam="PM" || pmam="AM"
    fi
}

call_for_jake1() {
    clear
    visited[call_jake1]=true

    echo "${BWHITE}${BOLD}=============================================================================${RESET}"
    echo
    bash ~/prjs/dotfilemgr/bin/ansigeneretor.sh "$hour:$minute $pmam"
    echo
    echo "${BWHITE}${BOLD}=============================================================================${RESET}"
    advtime 2
    echo "${GREEN}JAKE?${RESET}"
    echo
    echo "You call out for your son."
    echo "${ORANGE}BISCUITS${RESET} looks at you, confused" 
    sleep 2.5
    printf '\a'
    echo "......"
    sleep 2
    printf '\a'
    echo
    echo "No response."
    echo
    echo "What will you do?" 
    ind=1
    if [[ ${visited[check_phone1]} == false ]]; then 
        echo ">$ind: Check Your Phone"
        ((ind++))
    fi
    if [[ ${visited[approach_biscuits1]} == false ]]; then 
        echo ">$ind: Approach ${ORANGE}BISCUITS${RESET}"
        ((ind++))
    fi
    if [[ ${visited[watch_tv1]} == false ]]; then 
        echo ">$ind: Sit on the couch and watch TV"
        ((ind++))
    fi
    if [[ ${visited[call_jake1]} == false ]]; then 
        echo ">$ind: Call For ${GREEN}JAKE${RESET}"
        ((ind++))
    fi

    read -p ">" choice
    while [[ ! "$choice" =~ ^[0-9]+$ ]] || (( choice < 1 || choice >= ind )); do
        echo "Type a proper number, within the range!"
        read -rp ">" choice
    done
    ind=1

    if [[ ${visited[check_phone1]} == false ]]; then
        if (( choice == ind )); then check_phone1; return; fi
        ((ind++))
    fi

    if [[ ${visited[approach_biscuits1]} == false ]]; then
        if (( choice == ind )); then approach_biscuits1; return; fi
        ((ind++))
    fi

    if [[ ${visited[watch_tv1]} == false ]]; then
        if (( choice == ind )); then watch_tv1; return; fi
        ((ind++))
    fi

    if [[ ${visited[call_jake1]} == false ]]; then
        if (( choice == ind )); then call_for_jake1; return; fi
        ((ind++))
    fi
   
}

check_phone1() {
    clear
    visited[check_phone1]=true
    echo "${BWHITE}${BOLD}============================================================================="
    echo
    bash ~/prjs/dotfilemgr/bin/ansigeneretor.sh "$hour:$minute $pmam"
    echo
    echo "${BWHITE}${BOLD}============================================================================="
    advtime 1
    echo
    echo
    echo "${MAGENTA}MARY${RESET} - 5:31 PM"
    echo "Hey, did you pick Jake up from school?"
    echo
    echo "${MAGENTA}MARY${RESET} - 5:32 PM"
    echo "I might be home a little late today."
    echo "Love you."
    echo
    echo "================================"
    echo
    echo "${DIM}No other notifications.${RESET}"
    echo
    sleep 1
    ind=1
    if [[ ${visited[check_phone1]} == false ]]; then 
        echo ">$ind: Check Your Phone"
        ((ind++))
    fi
    if [[ ${visited[approach_biscuits1]} == false ]]; then 
        echo ">$ind: Approach ${ORANGE}BISCUITS${RESET}"
        ((ind++))
    fi
    if [[ ${visited[watch_tv1]} == false ]]; then 
        echo ">$ind: Sit on the couch and watch TV"
        ((ind++))
    fi
    if [[ ${visited[call_jake1]} == false ]]; then 
        echo ">$ind: Call For ${GREEN}JAKE${RESET}"
        ((ind++))
    fi

    read -p ">" choice
    while [[ ! "$choice" =~ ^[0-9]+$ ]] || (( choice < 1 || choice >= ind )); do
        echo "Type a proper number, within the range!"
        read -rp ">" choice
    done

    ind=1

    if [[ ${visited[check_phone1]} == false ]]; then
        if (( choice == ind )); then check_phone1; return; fi
        ((ind++))
    fi

    if [[ ${visited[approach_biscuits1]} == false ]]; then
        if (( choice == ind )); then approach_biscuits1; return; fi
        ((ind++))
    fi

    if [[ ${visited[watch_tv1]} == false ]]; then
        if (( choice == ind )); then watch_tv1; return; fi
        ((ind++))
    fi

    if [[ ${visited[call_jake1]} == false ]]; then
        if (( choice == ind )); then call_for_jake1; return; fi
        ((ind++))
    fi
    
}


approach_biscuits1() {
    clear
    visited[approach_biscuits1]=true
    echo "${BWHITE}${BOLD}=============================================================================${RESET}"
    echo
    bash ~/prjs/dotfilemgr/bin/ansigeneretor.sh "$hour:$minute $pmam"
    echo
    echo "${BWHITE}${BOLD}=============================================================================${RESET}"
    advtime 3

    echo
    echo "You walk towards ${ORANGE}BISCUITS${RESET}."
    echo
    sleep 2
    echo "${ORANGE}BISCUITS${RESET} gets up and approaches you."
    echo
    sleep 2
    echo "He wags his tail excitedly."
    echo
    echo "You kneel down and pet him."
    echo
    sleep 2
    echo "He seems happy to see you."
    echo
    echo "You scratch behind his ears."
    echo
    sleep 2
    echo "He lets out a quiet little whine."
    echo
    sleep 2
    echo "You notice his collar is slightly loose."
    echo
    sleep 1
    ind=1
    if [[ ${visited[check_phone1]} == false ]]; then 
        echo ">$ind: Check Your Phone"
        ((ind++))
    fi
    if [[ ${visited[approach_biscuits1]} == false ]]; then 
        echo ">$ind: Approach ${ORANGE}BISCUITS${RESET}"
        ((ind++))
    fi
    if [[ ${visited[watch_tv1]} == false ]]; then 
        echo ">$ind: Sit on the couch and watch TV"
        ((ind++))
    fi
    if [[ ${visited[call_jake1]} == false ]]; then 
        echo ">$ind: Call For ${GREEN}JAKE${RESET}"
        ((ind++))
    fi

    read -p ">" choice
    while [[ ! "$choice" =~ ^[0-9]+$ ]] || (( choice < 1 || choice >= ind )); do
        echo "Type a proper number, within the range!"
        read -rp ">" choice
    done

    ind=1
    if [[ ${visited[check_phone1]} == false ]]; then
        if (( choice == ind )); then check_phone1; return; fi
        ((ind++))
    fi

    if [[ ${visited[approach_biscuits1]} == false ]]; then
        if (( choice == ind )); then approach_biscuits1; return; fi
        ((ind++))
    fi

    if [[ ${visited[watch_tv1]} == false ]]; then
        if (( choice == ind )); then watch_tv1; return; fi
        ((ind++))
    fi

    if [[ ${visited[call_jake1]} == false ]]; then
        if (( choice == ind )); then call_for_jake1; return; fi
        ((ind++))
    fi
    
}

watch_tv1() {
    clear
    visited[watch_tv1]=true
    echo "${BWHITE}${BOLD}=============================================================================${RESET}"
    echo
    bash ~/prjs/dotfilemgr/bin/ansigeneretor.sh "$hour:$minute $pmam"
    echo
    echo "${BWHITE}${BOLD}=============================================================================${RESET}"
    advtime 90
    echo
    echo "You turn on the television."
    echo
    sleep 2
    echo "A news broadcast is playing."
    echo
    echo "You sink into the couch."
    echo
    sleep 3
    echo "The room is dimly lit by the television."
    echo
    sleep 3
    echo "You can barely keep your eyes open."
    echo
    sleep 3
    echo "The voices on the television begin to blur together."
    echo
    sleep 3
    echo "${DIM}...${RESET}"
    sleep 4
    clear
    echo
    echo "${DIM}The television continues playing.${RESET}"
    sleep 3
    echo
    echo "${DIM}...${RESET}"
    sleep 4
    clear
    echo
    echo "You suddenly open your eyes."
    echo
    sleep 2
    echo "Your neck hurts."
    echo "The television is still on."
    echo
    sleep 2
    echo "You sit up, disoriented."
    echo
    echo "For a moment, you don't remember"
    echo "where you are."
    echo
    sleep 3
    echo "You look at the clock."
    sleep 3
    echo "${BWHITE}${BOLD}=============================================================================${RESET}"
    echo
    bash ~/prjs/dotfilemgr/bin/ansigeneretor.sh "$hour:$minute $pmam"
    echo
    echo "${BWHITE}${BOLD}=============================================================================${RESET}"
    echo
    echo "${DIM}You fell asleep.${RESET}"
    echo
    sleep 2
    echo "You wonder how long were you out."
    echo
    clear
    echo "The news continues to play."
    echo
    echo
    sleep 2
    echo "${RED}${BOLD}${UNDERLINE}BREAKING NEWS:"
    echo
    sleep 0.8
    echo "${YELLOW}LOCAL CHILD REPORTED MISSING"
    echo
    sleep 0.5
    echo "AUTHORITIES HAVE YET TO GET"
    echo
    sleep 0.5
    echo "CLEAR LEADS.${RESET}"
    echo
    echo "${DIM}You barely pay attention.${RESET}"
    echo
    sleep 2
    echo
    echo "The anchor continues speaking."
    echo
    echo "${YELLOW}${BOLD}${UNDERLINE} \ THE VICTIM IS BELIEVED"
    echo "TO BE APPROXIMATELY 8 YEARS"
    echo "OLD.${RESET}"
    echo
    echo
    sleep 2
    echo "You pause."
    echo
    sleep 0.5
    echo "Eight?"
    echo "${DIM}...${RESET}"
    sleep 2
    echo "You turn towards the stairs."
    echo
    sleep 2
    echo "${GREEN}JAKE?${RESET}"
    echo
    sleep 3
    echo "No response."
    echo
    sleep 2
    echo "You turn the TV off."
    echo
    echo
    sleep 2
    echo "The house is quiet again."
    echo
    sleep 3
    echo "What do you do?"
    echo ">1: Check on ${GREEN}JAKE${RESET}"
    echo ">2: Look for ${ORANGE}BISCUITS${RESET}"
    echo ">3: Call ${MAGENTA}MARY${RESET}"
    read -p ">" choice
    while [[ ! "$choice" =~ ^[1-3]$ ]]
    do
        echo "Type a proper number, within the range!"
        read -p ">" choice
    done
    case $choice in
        1)
            check_jake1
            ;;
        2)
            search_biscuits1
            ;;
        3)
            call_mary1
            ;;
    esac
    advtime 8
}

check_jake1(){
    visited[check_jake1]=true
    echo "${BWHITE}${BOLD}=============================================================================${RESET}"
    echo
    bash ~/prjs/dotfilemgr/bin/ansigeneretor.sh "$hour:$minute $pmam"
    echo
    echo "${BWHITE}${BOLD}=============================================================================${RESET}"
    echo
    advtime 4
    echo "You walk upstairs and approach Jake's room."
    echo
    sleep 2
    echo "The door is slightly open."
    echo
    echo "You knock."
    sleep 2
    echo "No answer."
    echo
    echo "You push the door open."
    sleep 2
    echo "The room is empty."
    echo
    echo "His schoolbag is on the floor."
    echo "His bed is untouched."
    echo
    sleep 2
    echo
    echo "His homework lies on the ground."
    echo "It's untouched. A pencil lies"
    echo "beside it."
    echo
    sleep 2
    echo
    echo "You notice a drawing on his desk."
    echo
    echo "A picture of ${GREEN}JAKE${RESET}, ${MAGENTA}MARY${RESET}, you..."
    echo "And ${ORANGE}BISCUITS${RESET}."
    echo
    echo "The dog's eyes have been coloured completely black."
    echo
    ind=1
    if [[ ${visited[uncover_biscuit]} != true ]]; then
        echo ">$ind: Look at the drawing"
        ((ind++))
    fi
    if [[ ${visited[search_biscuits1]} != true ]]; then
        echo ">$ind: Search for ${ORANGE}BISCUITS${RESET}"
        ((ind++))
    fi
    if [[ ${visited[call_mary1]} != true ]]; then
        echo ">$ind: Call ${MAGENTA}MARY${RESET}"
        ((ind++))
    fi
    if (( ind == 1 )); then
        echo "There's nothing else to do."
        return
    fi

    read -p ">" choice

    while [[ ! "$choice" =~ ^[0-9]+$ ]] || (( choice < 1 || choice >= ind )); do
        echo "Type a proper number, within the range!"
        read -rp ">" choice
    done

    ind=1

    if [[ ${visited[uncover_biscuit]} != true ]]; then
        if (( choice == ind )); then uncover_biscuit; return; fi
        ((ind++))
    fi

    if [[ ${visited[search_biscuits1]} != true ]]; then
        if (( choice == ind )); then search_biscuits1; return; fi
        ((ind++))
    fi

    if [[ ${visited[call_mary1]} != true ]]; then
        if (( choice == ind )); then call_mary1; return; fi
        ((ind++))
    fi
    advtime 8 
}

uncover_biscuit() {
    visited[uncover_biscuit]=true
    echo "You pick up the drawing."
    sleep 2
    echo "There is something written on the back."
    sleep 2
    echo "${RED}HE IS NOT BISCUITS.${RESET}"
    echo
    echo "What do you do?"
    echo
    ind=1

    if [[ ${visited[search_biscuits1]} != true ]]; then
        echo ">$ind: Search for ${ORANGE}BISCUITS${RESET}"
        ((ind++))
    fi

    if [[ ${visited[call_mary1]} != true ]]; then
        echo ">$ind: Call ${MAGENTA}MARY${RESET}"
        ((ind++))
    fi

    if (( ind == 1 )); then
        echo "There's nothing else to do."
        return
    fi

    read -p ">" choice

    while [[ ! "$choice" =~ ^[0-9]+$ ]] || (( choice < 1 || choice >= ind )); do
        echo "Type a proper number, within the range!"
        read -rp ">" choice
    done

    ind=1

    if [[ ${visited[search_biscuits1]} != true ]]; then
        if (( choice == ind )); then search_biscuits1; return; fi
        ((ind++))
    fi

    if [[ ${visited[call_mary1]} != true ]]; then
        if (( choice == ind )); then call_mary1; return; fi
        ((ind++))
    fi
    advtime 4
}

search_biscuits1(){
    visited[search_biscuits1]=true
    echo "${BWHITE}${BOLD}=============================================================================${RESET}"
    echo
    bash ~/prjs/dotfilemgr/bin/ansigeneretor.sh "$hour:$minute $pmam"
    echo
    echo "${BWHITE}${BOLD}=============================================================================${RESET}"
    advtime 5
    echo "You look around the house for ${ORANGE}BISCUITS${RESET}."
    echo
    sleep 2
    echo "You check the living room."
    echo "Nothing."
    sleep 2
    echo "The kitchen."
    echo "Nothing."
    sleep 2
    echo "Then you hear a faint sound."
    echo
    echo "*tap*"
    sleep 1
    echo "*tap*"
    sleep 2
    echo "You turn towards the stairs."
    echo
    echo "${ORANGE}BISCUITS${RESET} is standing at the top."
    echo "He is holding something in his mouth."
    echo
    sleep 2
    echo "You can't make out what it is."
    echo
    echo "You call his name."
    echo "His ears twitch."
    echo
    sleep 2
    echo "He walks out of sight."
    echo
    ind=1

    if [[ ${visited[call_bisky]} != true ]]; then
        echo ">$ind: Call ${ORANGE}HIM${RESET} downstairs"
        ((ind++))
    fi

    if [[ ${visited[check_jake1]} != true ]]; then
        echo ">$ind: Go upstairs"
        ((ind++))
    fi

    if [[ ${visited[call_mary1]} != true ]]; then
        echo ">$ind: Call ${MAGENTA}MARY${RESET}"
        ((ind++))
    fi

    read -p ">" choice

    while [[ ! "$choice" =~ ^[0-9]+$ ]] || (( choice < 1 || choice >= ind )); do
        echo "Type a proper number, within the range!"
        read -rp ">" choice
    done

    ind=1

    if [[ ${visited[call_bisky]} != true ]]; then
        if (( choice == ind )); then call_bisky; return; fi
        ((ind++))
    fi

    if [[ ${visited[check_jake1]} != true ]]; then
        if (( choice == ind )); then check_jake1; return; fi
        ((ind++))
    fi

    if [[ ${visited[call_mary1]} != true ]]; then
        if (( choice == ind )); then call_mary1; return; fi
        ((ind++))
    fi
}

call_bisky(){
    visited[call_bisky]=true

    echo "You call ${ORANGE}BISCUITS${RESET}."
    sleep 2
    echo "He slowly turns away."
    sleep 2
    echo
    echo "What do you do?"
    echo ">1: Go upstairs"

    ind=2
    if [[ ${visited[call_mary1]} != true ]]; then
        echo ">$ind: Call ${MAGENTA}MARY${RESET}"
        ((ind++))
    fi

    read -rp ">" choice

    while [[ ! "$choice" =~ ^[0-9]+$ ]] || (( choice < 1 || choice >= ind )); do
        echo "Type a proper number, within the range!"
        read -rp ">" choice
    done

    if (( choice == 1 )); then
        bisky_confrontation
        return
    fi

    call_mary1
}

call_mary1(){
    visited[call_mary1]=true
    echo "${BWHITE}${BOLD}=============================================================================${RESET}"
    echo
    bash ~/prjs/dotfilemgr/bin/ansigeneretor.sh "$hour:$minute $pmam"
    echo
    echo "${BWHITE}${BOLD}=============================================================================${RESET}"
    advtime 2
    echo "You take out your phone and call ${MAGENTA}MARY${RESET}."
    echo
    sleep 2
    echo "RINGING..."
    sleep 2
    echo "RINGING..."
    sleep 2
    echo
    echo "${MAGENTA}MARY:${RESET} Hey. Is everything alright?"
    echo
    echo "You ask if she knows where ${GREEN}JAKE${RESET} is."
    sleep 2
    echo
    echo "${MAGENTA}MARY:${RESET} Isn't he home?"
    echo
    echo "You tell her you can't find him."
    sleep 2
    echo
    echo "${MAGENTA}MARY:${RESET} Wait, what?"
    echo
    echo "${MAGENTA}MARY:${RESET} He was asking about ${ORANGE}BISCUITS${RESET} earlier."
    echo "${MAGENTA}MARY:${RESET} Said something was wrong with him."
    sleep 2
    echo
    echo "${MAGENTA}MARY:${RESET} I'll come home. Just... check upstairs."
    echo
    echo "The call ends."
    echo
    sleep 1
    echo "What do you do?"
    echo ">1: Go upstairs"

    ind=2
    if [[ ${visited[call_bisky]} != true ]]; then
        echo ">$ind: Call ${ORANGE}BISCUITS${RESET} downstairs"
        ((ind++))
    fi

    read -rp ">" choice

    while [[ ! "$choice" =~ ^[0-9]+$ ]] || (( choice < 1 || choice >= ind )); do
        echo "Type a proper number, within the range!"
        read -rp ">" choice
    done

    if (( choice == 1 )); then
        bisky_confrontation
        return
    fi

    call_bisky
}

bisky_confrontation(){
    visited[bisky_confrontation]=true

    clear
    echo "${BWHITE}${BOLD}=============================================================================${RESET}"
    echo
    bash ~/prjs/dotfilemgr/bin/ansigeneretor.sh "$hour:$minute $pmam"
    echo
    echo "${BWHITE}${BOLD}=============================================================================${RESET}"
    echo

    echo "You slowly climb the stairs."
    sleep 2
    echo
    echo "Something is standing outside Jake's room."
    sleep 2
    echo
    echo "${ORANGE}BISCUITS${RESET}."
    echo
    echo "He is facing the wall."
    sleep 2
    echo
    echo "You call his name."
    sleep 2
    echo
    echo "Nothing."
    echo
    echo "Then, without turning around..."
    sleep 2
    echo
    echo "${ORANGE}BISCUITS:${RESET} Jake isn't here."
    echo
    sleep 3
    echo "You freeze."
    echo
    echo "You never taught him to speak."
    echo
    sleep 3
    echo "Something slowly turns its head towards you."
    echo
    echo "${RED}HE IS NOT BISCUITS.${RESET}"
    echo
    sleep 3

    echo ">1: Run downstairs"
    echo ">2: Stay where you are"

    read -p ">" choice

    while [[ ! "$choice" =~ ^[1-2]$ ]]; do
        read -rp ">" choice
    done

    bisky_ending
}

bisky_ending(){
    clear
    echo
    sleep 2

    echo "You turn and run."
    sleep 2
    echo
    echo "You hear something following you."
    sleep 2
    echo
    echo "*THUD*"
    sleep 2
    echo
    echo "You reach the bottom of the stairs."
    sleep 2
    echo
    echo "Your phone rings."
    echo
    echo "${MAGENTA}MARY${RESET}"
    sleep 2
    echo
    echo "You reach for it."
    sleep 2
    echo
    echo "A familiar voice comes from upstairs."
    echo
    echo "${ORANGE}BISCUITS:${RESET} Dad?"
    sleep 3
    echo
    echo "You stop."
    echo
    echo "${ORANGE}BISCUITS:${RESET} Can you come upstairs?"
    sleep 3
    echo
    echo "Your phone stops ringing."
    sleep 2
    dir="$(dirname "$0")"
    for i in {1..20}; do
        cat "$dir/jscare.ans" "$dir/jscare.ans" "$dir/jscare.ans"
    done
    echo
    echo "${RED}${BOLD}CONNECTION LOST.${RESET}"
    sleep 3
    clear
    echo
    echo "${RED}${BOLD}DEAD FREQUENCY${RESET}"
    echo
    echo "${DIM}END 01 — THE WRONG ONE${RESET}"
    sleep 2
    echo "lmao i dint have time to make some proper stuff so yeah thats it :<<"
    sleep 20
    exit
}

return_home() {
    clear


    echo "${BWHITE}${BOLD}=============================================================================${RESET}"
    echo
    bash ~/prjs/dotfilemgr/bin/ansigeneretor.sh "$hour:$minute $pmam"
    echo
    echo "${BWHITE}${BOLD}=============================================================================${RESET}"

    echo
    echo "You arrive home."
    echo
    sleep 2
    printf '\a'
    echo
    echo "You have just been laid off from"
    echo "your job as ${CYAN}Senior Scientist${RESET}"
    echo "at ${YELLOW}MORROW BIOTECHNICS${RESET}"
    echo
    sleep 2
    printf '\a'
    echo
    echo "${MAGENTA}MARY${RESET}, your loving wife, is still"
    echo "out working."
    echo
    sleep 2
    printf '\a'
    echo
    echo "The house is unusually quiet."
    echo "But you don't know the difference"
    echo
    sleep 2
    printf '\a'
    echo
    echo "You hear something upstairs."
    echo "It's probably ${GREEN}JAKE${RESET}"
    echo
    sleep 2
    printf '\a'
    echo
    echo "${ORANGE}BISCUITS${RESET}, your golden retriever,"
    echo "is sitting by the stairs"
    echo "wagging his tail, looking at you"
    echo
    sleep 2
    printf '\a'
    echo
    echo "What will you do?" 
    echo ">1: Call For ${GREEN}JAKE${RESET}"
    echo ">2: Check Your Phone"
    echo ">3: Approach ${ORANGE}BISCUITS${RESET}"
    echo ">4: Sit on the couch and watch TV"
    read -p ">" choice
    while [[ ! "$choice" =~ ^[1-4]$ ]]
    do
        echo "Type a proper number, within the range!"
        read -p ">" choice
    done
 

    case $choice in
        1)
            call_for_jake1
            ;;
        2)
            check_phone1
            ;;
        3)
            approach_biscuits1
            ;;
        4)
            watch_tv1
            ;;
    esac
    advtime 2
}


clear




echo -e "${BWHITE}${BOLD}====================================================================================================="

echo

echo -e "${BYELLOW}
██████╗ ███████╗ █████╗ ██████╗ 
██╔══██╗██╔════╝██╔══██╗██╔══██╗
██║  ██║█████╗  ███████║██║  ██║
██║  ██║██╔══╝  ██╔══██║██║  ██║
██████╔╝███████╗██║  ██║██████╔╝
╚═════╝ ╚══════╝╚═╝  ╚═╝╚═════╝ 

███████╗██████╗ ███████╗ ██████╗ ██╗   ██╗███████╗███╗   ██╗ ██████╗██╗   ██╗
██╔════╝██╔══██╗██╔════╝██╔═══██╗██║   ██║██╔════╝████╗  ██║██╔════╝╚██╗ ██╔╝
█████╗  ██████╔╝█████╗  ██║   ██║██║   ██║█████╗  ██╔██╗ ██║██║      ╚████╔╝ 
██╔══╝  ██╔══██╗██╔══╝  ██║▄▄ ██║██║   ██║██╔══╝  ██║╚██╗██║██║       ╚██╔╝  
██║     ██║  ██║███████╗╚██████╔╝╚██████╔╝███████╗██║ ╚████║╚██████╗   ██║   
╚═╝     ╚═╝  ╚═╝╚══════╝ ╚══▀▀═╝  ╚═════╝ ╚══════╝╚═╝  ╚═══╝ ╚═════╝   ╚═╝   
${RESET}"

echo

echo -e "${BWHITE}${BOLD}=====================================================================================================${RESET}"

echo
echo
echo -e "${RED}boo scary scary${RESET}"
echo
read -p "${GREEN}ENTER to continue......${RESET}"


return_home

