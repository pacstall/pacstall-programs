After installing, run the following commands:

    # enable service to avoid communication error
    sudo systemctl enable ecbd.service
    sudo systemctl start ecbd.service
    # fix ppa if ubuntu release is posterior to groovy
    codename=$(lsb_release -cs)
    case $codename in
    	focal | groovy)
    		;;
    	*)
    		sudo sed -i "s/$codename/groovy/g" "/etc/apt/sources.list.d/gezakovacs-ubuntu-ppa-$codename.list"
    		sudo apt update
    		sudo apt install -y libqtgui4
    		;;
    esac

The postinst() part of the script is currently not read by pacstall, see issue [#280](https://github.com/pacstall/pacstall/issues/280)
