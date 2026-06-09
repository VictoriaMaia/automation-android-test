*** Variables ***

${ANDROID_APP}                ${EXECDIR}/app/yodapp-beta.apk

# initial screen

${START_BUTTON}               QAX

# xpath of navigator menu

${NAVIGATOR_MENU_ICON}        xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]
${CLIQUE_BOTOES_OPTION}       xpath=//*[@resource-id="com.qaxperience.yodapp:id/rvNavigation"]//*[@text="Clique em Botões"]

