for i in $(ls /home/ajinkyabapat/enfold-lego/enfold-ansible/lego_stack/roles/portal-appliance/tasks/*.yml)
do
    echo $i
    ansible-playbook --list-tags $i 2>&1
done


