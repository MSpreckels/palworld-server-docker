#!/bin/bash

STARTCOMMAND="./PalServer.sh"

#if [ -n "${PORT}" ]; then
#    STARTCOMMAND="${STARTCOMMAND} -port=${PORT}"
#fi
#
#if [ -n "${PLAYERS}" ]; then
#    STARTCOMMAND="${STARTCOMMAND} -players=${PLAYERS}"
#fi
#
#if [ "${COMMUNITY}" = true ]; then
#    STARTCOMMAND="${STARTCOMMAND} EpicApp=PalServer"
#fi
#
#if [ -n "${PUBLIC_IP}" ]; then
#    STARTCOMMAND="${STARTCOMMAND} -publicip=${PUBLIC_IP}"
#fi
#
#if [ -n "${PUBLIC_PORT}" ]; then
#    STARTCOMMAND="${STARTCOMMAND} -publicport=${PUBLIC_PORT}"
#fi

#if [ -n "${SERVER_NAME}" ]; then
#    STARTCOMMAND="${STARTCOMMAND} -servername=${SERVER_NAME}"
#fi

#if [ -n "${SERVER_PASSWORD}" ]; then
#    STARTCOMMAND="${STARTCOMMAND} -serverpassword=${SERVER_PASSWORD}"
#fi
#
#if [ -n "${ADMIN_PASSWORD}" ]; then
#    STARTCOMMAND="${STARTCOMMAND} -adminpassword=${ADMIN_PASSWORD}"
#fi
#
#if [ -n "${QUERY_PORT}" ]; then
#    STARTCOMMAND="${STARTCOMMAND} -queryport=${QUERY_PORT}"
#fi
#
#if [ "${MULTITHREADING}" = true ]; then
#    STARTCOMMAND="${STARTCOMMAND} -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS"
#fi

cd /palworld || exit

printf "\e[0;32m*****CHECKING FOR EXISTING CONFIG*****\e[0m\n"

if [ ! -f /palworld/Pal/Saved/Config/LinuxServer/PalWorldSettings.ini ]; then

    printf "\e[0;32m*****GENERATING CONFIG*****\e[0m\n"

    # Server will generate all ini files after first run.
    su steam -c "timeout --preserve-status 15s ./PalServer.sh 1> /dev/null "

    # Wait for shutdown
    sleep 5

    cp /palworld/DefaultPalWorldSettings.ini /palworld/Pal/Saved/Config/LinuxServer/PalWorldSettings.ini
fi

#if [ -n "${RCON_ENABLED}" ]; then
#    echo "RCON_ENABLED=${RCON_ENABLED}"
#    sed -i "s/RCONEnabled=[a-zA-Z]*/RCONEnabled=$RCON_ENABLED/" /palworld/Pal/Saved/Config/LinuxServer/PalWorldSettings.ini
#fi
#if [ -n "${RCON_PORT}" ]; then
#    echo "RCON_PORT=${RCON_PORT}"
#    sed -i "s/RCONPort=[0-9]*/RCONPort=$RCON_PORT/" /palworld/Pal/Saved/Config/LinuxServer/PalWorldSettings.ini
#fi

sed -i "s/RCONEnabled=[a-zA-Z]*/RCONEnabled=False/" /palworld/Pal/Saved/Config/LinuxServer/PalWorldSettings.ini


#PARAMS="Difficulty=None,DayTimeSpeedRate=1.000000,NightTimeSpeedRate=1.000000,ExpRate=1.000000,PalCaptureRate=1.000000,PalSpawnNumRate=1.000000,PalDamageRateAttack=1.000000,PalDamageRateDefense=1.000000,PlayerDamageRateAttack=1.000000,PlayerDamageRateDefense=1.000000,PlayerStomachDecreaceRate=1.000000,PlayerStaminaDecreaceRate=1.000000,PlayerAutoHPRegeneRate=1.000000,PlayerAutoHpRegeneRateInSleep=1.000000,PalStomachDecreaceRate=1.000000,PalStaminaDecreaceRate=1.000000,PalAutoHPRegeneRate=1.000000,PalAutoHpRegeneRateInSleep=1.000000,BuildObjectDamageRate=1.000000,BuildObjectDeteriorationDamageRate=1.000000,CollectionDropRate=1.000000,CollectionObjectHpRate=1.000000,CollectionObjectRespawnSpeedRate=1.000000,EnemyDropItemRate=1.000000,DeathPenalty=All,bEnablePlayerToPlayerDamage=False,bEnableFriendlyFire=False,bEnableInvaderEnemy=True,bActiveUNKO=False,bEnableAimAssistPad=True,bEnableAimAssistKeyboard=False,DropItemMaxNum=3000,DropItemMaxNum_UNKO=100,BaseCampMaxNum=128,BaseCampWorkerMaxNum=15,DropItemAliveMaxHours=1.000000,bAutoResetGuildNoOnlinePlayers=False,AutoResetGuildTimeNoOnlinePlayers=72.000000,GuildPlayerMaxNum=20,PalEggDefaultHatchingTime=72.000000,WorkSpeedRate=1.000000,bIsMultiplay=False,bIsPvP=False,bCanPickupOtherGuildDeathPenaltyDrop=False,bEnableNonLoginPenalty=True,bEnableFastTravel=True,bIsStartLocationSelectByMap=True,bExistPlayerAfterLogout=False,bEnableDefenseOtherGuildPlayer=False,CoopPlayerMaxNum=4,ServerPlayerMaxNum=32,ServerName=\"Default Palworld Server\",ServerDescription=\"\",AdminPassword=\"\",ServerPassword=\"\",PublicPort=8211,PublicIP=\"\",RCONEnabled=True,RCONPort=25575,Region=\"\",bUseAuth=True,BanListURL=\"https://api.palworldgame.com/api/banlist.txt\""

# does not work??
#PARAMS='Difficulty=None,DayTimeSpeedRate=1.000000,NightTimeSpeedRate=1.000000,ExpRate=1.000000,PalCaptureRate=1.000000,PalSpawnNumRate=1.000000,PalDamageRateAttack=1.000000,PalDamageRateDefense=1.000000,PlayerDamageRateAttack=1.000000,PlayerDamageRateDefense=1.000000,PlayerStomachDecreaceRate=1.000000,PlayerStaminaDecreaceRate=1.000000,PlayerAutoHPRegeneRate=1.000000,PlayerAutoHpRegeneRateInSleep=1.000000,PalStomachDecreaceRate=1.000000,PalStaminaDecreaceRate=1.000000,PalAutoHPRegeneRate=1.000000,PalAutoHpRegeneRateInSleep=1.000000,BuildObjectDamageRate=1.000000,BuildObjectDeteriorationDamageRate=1.000000,CollectionDropRate=1.000000,CollectionObjectHpRate=1.000000,CollectionObjectRespawnSpeedRate=1.000000,EnemyDropItemRate=1.000000,DeathPenalty=All,bEnablePlayerToPlayerDamage=False,bEnableFriendlyFire=False,bEnableInvaderEnemy=True,bActiveUNKO=False,bEnableAimAssistPad=True,bEnableAimAssistKeyboard=False,DropItemMaxNum=3000,DropItemMaxNum_UNKO=100,BaseCampMaxNum=128,BaseCampWorkerMaxNum=15,DropItemAliveMaxHours=1.000000,bAutoResetGuildNoOnlinePlayers=False,AutoResetGuildTimeNoOnlinePlayers=72.000000,GuildPlayerMaxNum=20,PalEggDefaultHatchingTime=72.000000,WorkSpeedRate=1.000000,bIsMultiplay=False,bIsPvP=False,bCanPickupOtherGuildDeathPenaltyDrop=False,bEnableNonLoginPenalty=True,bEnableFastTravel=True,bIsStartLocationSelectByMap=True,bExistPlayerAfterLogout=False,bEnableDefenseOtherGuildPlayer=False,CoopPlayerMaxNum=4,ServerPlayerMaxNum=32,ServerName="Default Palworld Server",ServerDescription="",AdminPassword="",ServerPassword="",PublicPort=8211,PublicIP="",RCONEnabled=True,RCONPort=25575,Region="",bUseAuth=True,BanListURL="https://api.palworldgame.com/api/banlist.txt"'

# works, i can run rcon-cli info
#PARAMS='RCONEnabled=True'

PARAMS='ServerPlayerMaxNum=1,RCONEnabled=true'

# rcon-cli info does not work anymore
#PARAMS='ServerName=Hello World,RCONEnabled=True'

# rcon-cli info does not work anymore
#PARAMS='ServerName="Hello World",RCONEnabled=True'

# rcon-cli info does not work anymore
#PARAMS='ServerName=\"Hello World\",RCONEnabled=True'

# thought it might be the ServerName but doesnt work either
#PARAMS='ServerPlayerMaxNum=1,RCONEnabled=True'

# this works but the ServerName is still "Default Palworld Server"
#STARTCOMMAND="${STARTCOMMAND} -ini:PalWorldSettings:[/Script/Pal.PalGameWorldSettings]:OptionSettings='(ServerName=\"Hello World\")'"
#STARTCOMMAND="${STARTCOMMAND} -ini:PalWorldSettings:[/Script/Pal.PalGameWorldSettings]:OptionSettings='(RCONEnabled=True)'"

STARTCOMMAND="${STARTCOMMAND} -ini:PalWorldSettings:[/Script/Pal.PalGameWorldSettings]:OptionSettings='($PARAMS)'"

cat /palworld/Pal/Saved/Config/LinuxServer/PalWorldSettings.ini

# Configure RCON settings
cat >~/.rcon-cli.yaml  <<EOL
host: localhost
port: ${RCON_PORT}
password: ${ADMIN_PASSWORD}
EOL

printf "\e[0;32m*****STARTING SERVER*****\e[0m\n"
echo "${STARTCOMMAND}"
su steam -c "${STARTCOMMAND}"
