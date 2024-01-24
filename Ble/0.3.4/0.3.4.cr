class Target < ISM::Software
    
    def prepareInstallation
        super

        makeDirectory("#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/share")
        copyDirectory("#{workDirectoryPath(false)}/Sources","#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/share/ble")
    end

    def showInformations
        super

        showInfoTitle
        showInfo("After the installation, if you wish to use Ble, add this to your .bashrc file:")
        showInfoCode("\t[[ $- == *i* ]] && source /usr/share/ble/ble.sh --attach=none")
        showInfoCode("\t[[ ${BLE_VERSION-} ]] && ble-attach                          ")
        showEndInfo
    end

end
