ZSHA_BASE=$HOME/zshetup

source $(dirname $(gem which colorls))/tab_complete.sh
alias -g uls='/usr/local/src'
alias lc='colorls -lA --sd'


source $ZSHA_BASE/antigen/antigen.zsh

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle chrissicool/zsh-256color
antigen bundle gretzky/auto-color-ls
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search


POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_home custom_user load disk_usage dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)

POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\ue602'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\ue602'

ZI_KEYBOARD="\ufcbe"
ZI_HOME="\uf7db"			# liquid
ZI_LAPTOP="\uf823"			# mac
ZI_WIFI="\ufaa8"
ZI_VPN="\ufa81"				# vpn
ZI_SECRET="\uf21b"
ZI_LOCK="\uf456"
ZI_MAIL="\uf6f0"			# mx new
ZI_SERVER="\uf991"
ZI_KEY="\uf43d"				# ssh
ZI_LOCKALT="\uf456"
ZI_SERVREM="\uf990"
ZI_MAILOLD="\ufbcd"			# mx old
ZI_EURO="\uf6ac"			# own.is

ZI_DEB="\uf306"
ZI_UBU="\uf31b"
ZI_MAC="\uf302"
ZI_LIN="\ue712"
ZI_WIN="\uf17a"

ZI_ROOT="\uf234"
ZI_UPARROW="\ufb31"
ZI_USER="\uf2c0"

ZI_WEBROOT="\uf0e8"			# www
ZI_FOLDER="\uf07b"
ZI_BROKENHEART="\uf7d3"
ZI_EKG="\uf21e"				# z
ZI_PULSE="\ue234"
ZI_PERSON="\uf7e5"
ZI_HEART="\uf004"
ZI_ID="\uf2bb"
ZI_IDALT="\uf2bc"
ZI_FINGERPRINT="\uf736"
ZI_GAY="\uf227"
ZI_TRANS="\uf79e"
ZI_SPERM="\ue205"
ZI_DRESS="\ue274"
ZI_SHOE="\ue250"			# own
ZI_LIPS="\ue258"
ZI_PODCAST="\uf2ce"
ZI_INFINITY="\ue255"			# root
ZI_FLAME="\uf490"			# own.is

ZMNAME=$(hostname)
if [ $ZMNAME = "liquid" ]; then
	ZB_SNAME="liquid"
	ZB_HOST=$ZI_FLAME
	ZB_1_BAK='005'
	ZB_1_FOR='015'
	ZB_2_BAK='021'
	ZB_2_FOR='015'
	ZB_3_BAK='002'
	ZB_3_FOR='015'
	ZB_4_BAK='003'
	ZB_4_FOR='015'
	ZB_5_BAK='202'
	ZB_5_FOR='015'
	ZB_6_BAK='001'
	ZB_6_FOR='015'
	ZIP=$(dig +short myip.opendns.com @resolver1.opendns.com)
	if [ $ZIP = "96.246.81.180" ]; then
		# home/exposed
		ZB_NET=$ZI_WIFI
	else
		ZB_NET=$ZI_SECRET
	fi
elif [ $ZMNAME = "SexyBook-Pro.local" ]; then
	ZB_SNAME="sexybook"
	ZB_HOST=$ZI_LAPTOP
	ZB_1_BAK='013'
	ZB_1_FOR='015'
	ZB_2_BAK='002'
	ZB_2_FOR='015'
	ZB_3_BAK='010'
	ZB_3_FOR='015'
	ZB_4_BAK='011'
	ZB_4_FOR='015'
	ZB_5_BAK='172'
	ZB_5_FOR='015'
	ZB_6_BAK='009'
	ZB_6_FOR='015'
	ZIP=$(dig +short myip.opendns.com @resolver1.opendns.com)
	if [ $ZIP = "96.246.81.180" ]; then
		ZB_NET=$ZI_WIFI
	else
		ZB_NET=$ZI_SECRET
	fi
elif [ $ZMNAME = "m" ]; then
	ZB_SNAME="mx"
	ZB_HOST=$ZI_MAIL
	ZB_1_BAK='000'
	ZB_1_FOR='015'
	ZB_2_BAK='021'
	ZB_2_FOR='015'
	ZB_3_BAK='000'
	ZB_3_FOR='015'
	ZB_4_BAK='004'
	ZB_4_FOR='015'
	ZB_5_BAK='015'
	ZB_5_FOR='009'
	ZB_6_BAK='004'
	ZB_6_FOR='015'
	ZB_NET=$ZI_KEY
elif [ $ZHOSTN = "broken" ]; then
	ZB_SNAME="sub.sex"
	ZB_HOST=$ZI_WEBROOT
	ZB_1_BAK='161'
	ZB_1_FOR='015'
	ZB_2_BAK='161'
	ZB_2_FOR='015'
	ZB_3_BAK='005'
	ZB_3_FOR='015'
	ZB_4_BAK='005'
	ZB_4_FOR='015'
	ZB_5_BAK='004'
	ZB_5_FOR='015'
	ZB_6_BAK='004'
	ZB_6_FOR='015'
	ZB_NET=$ZI_KEY
elif [ $ZHOSTN = "own.is" ]; then
	ZB_SNAME="own.is"
	ZB_HOST=$ZI_FLAME
	ZB_1_BAK='074'
	ZB_1_FOR='000'
	ZB_2_BAK='183'
	ZB_2_FOR='000'
	ZB_3_BAK='074'
	ZB_3_FOR='000'
	ZB_4_BAK='183'
	ZB_4_FOR='000'
	ZB_5_BAK='015'
	ZB_5_FOR='000'
	ZB_6_BAK='074'
	ZB_6_FOR='000'
	ZB_NET=$ZI_KEY
elif [ $ZHOSTN = "www" ]; then
	ZB_SNAME="www_old"
	ZB_HOST=$ZI_SERVREM
	ZB_1_BAK='240'
	ZB_1_FOR='015'
	ZB_2_BAK='239'
	ZB_2_FOR='015'
	ZB_3_BAK='238'
	ZB_3_FOR='015'
	ZB_4_BAK='237'
	ZB_4_FOR='015'
	ZB_5_BAK='236'
	ZB_5_FOR='015'
	ZB_6_BAK='235'
	ZB_6_FOR='015'
	ZB_NET=$ZI_KEY
elif [ $ZHOSTN = "mx" ]; then
	ZB_SNAME="mx_old"
	ZB_HOST=$ZI_MAILOLD
	ZB_1_BAK='240'
	ZB_1_FOR='015'
	ZB_2_BAK='239'
	ZB_2_FOR='015'
	ZB_3_BAK='238'
	ZB_3_FOR='015'
	ZB_4_BAK='237'
	ZB_4_FOR='015'
	ZB_5_BAK='236'
	ZB_5_FOR='015'
	ZB_6_BAK='235'
	ZB_6_FOR='015'
	ZB_NET=$ZI_KEY
fi

if [ $USERNAME = "root" ]; then
	ZB_USER=$ZI_INFINITY
elif [ $USERNAME = "own" ]; then
	ZB_USER=$ZI_SECRET
else
	ZB_USER=$ZI_EKG
fi

ZHOSTN=$(uname -s)
if [ $ZHOSTN = "Darwin" ]; then
	ZB_OS=$ZI_MAC
elif [ $ZHOSTN = "Linux" ]; then
	ZB_OS=$ZI_LIN
	if [ $(uname -r | grep Microsoft) ]; then 
		ZB_OS+=$ZI_WIN;
		eval $(/mnt/d/Tools/ssh-agent-wsl/ssh-agent-wsl -r)
	fi
	ZISSUE=$(< /etc/issue)
	if [[ $ZISSUE == *"Debian"* ]]; then
		ZB_OS=$ZI_DEB
	elif [[ $ZISSUE == *"Ubuntu"* ]]; then
		ZB_OS=$ZI_UBU
	fi
fi

POWERLEVEL9K_CUSTOM_HOME=" echo -n ' $ZB_HOST $ZB_USER $ZB_OS $ZB_NET'"
POWERLEVEL9K_CUSTOM_HOME_BACKGROUND=$ZB_1_BAK
POWERLEVEL9K_CUSTOM_HOME_FOREGROUND=$ZB_1_FOR

POWERLEVEL9K_CUSTOM_USER=" echo -n '$USERNAME@$ZB_SNAME '"
POWERLEVEL9K_CUSTOM_USER_BACKGROUND=$ZB_2_BAK
POWERLEVEL9K_CUSTOM_USER_FOREGROUND=$ZB_2_FOR

POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND=$ZB_3_BAK
POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND=$ZB_3_FOR
POWERLEVEL9K_LOAD_WARNING_BACKGROUND=$ZB_3_BAK
POWERLEVEL9K_LOAD_WARNING_FOREGROUND=$ZB_3_FOR
POWERLEVEL9K_LOAD_NORMAL_BACKGROUND=$ZB_3_BAK
POWERLEVEL9K_LOAD_NORMAL_FOREGROUND=$ZB_3_FOR
POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="yellow"
POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="white"

POWERLEVEL9K_DISK_USAGE_CRITICAL_BACKGROUND=$ZB_4_BAK
POWERLEVEL9K_DISK_USAGE_CRITICAL_FOREGROUND=$ZB_4_FOR
POWERLEVEL9K_DISK_USAGE_WARNING_BACKGROUND=$ZB_4_BAK
POWERLEVEL9K_DISK_USAGE_WARNING_FOREGROUND=$ZB_4_FOR
POWERLEVEL9K_DISK_USAGE_NORMAL_BACKGROUND=$ZB_4_BAK
POWERLEVEL9K_DISK_USAGE_NORMAL_FOREGROUND=$ZB_4_FOR
POWERLEVEL9K_DISK_USAGE_CRITICAL_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_DISK_USAGE_WARNING_VISUAL_IDENTIFIER_COLOR="yellow"
POWERLEVEL9K_DISK_USAGE_NORMAL_VISUAL_IDENTIFIER_COLOR="white"

POWERLEVEL9K_DIR_HOME_BACKGROUND=$ZB_5_BAK
POWERLEVEL9K_DIR_HOME_FOREGROUND=$ZB_5_FOR
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=$ZB_5_BAK
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=$ZB_5_FOR
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=$ZB_5_BAK
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND=$ZB_5_FOR
POWERLEVEL9K_DIR_ETC_BACKGROUND=$ZB_5_BAK
POWERLEVEL9K_DIR_ETC_FOREGROUND='yellow'

POWERLEVEL9K_VCS_CLEAN_FOREGROUND='white'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND=$ZB_6_BAK
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='gray'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=$ZB_6_BAK
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=$ZB_6_BAK

antigen theme bhilburn/powerlevel9k powerlevel9k
antigen apply
cd ~


