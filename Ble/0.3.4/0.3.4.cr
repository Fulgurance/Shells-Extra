class Target < ISM::Software
    
    def prepareInstallation
        super

        makeDirectory("#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/share")

        copyDirectory(  "#{workDirectoryPath}/Sources",
                        "#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/share/ble")
    end

    def showInformations
        super

        showInfo("After the installation, if you wish to use Ble, add this to your .bashrc file:")
        showInfoCode("[[ $- == *i* ]] && source /usr/share/ble/ble.sh --attach=none")
        showInfoCode("[[ ${BLE_VERSION-} ]] && ble-attach                          ")
    end

end
