# HOW TO

If you want to be able to quickly access ranger , you can put this in your .bash_profile

alias rg='docker run -it --name "ranger" --mount type=volume,source=rangerinfos,destination=/mnt/rangerinfos -w /home/app/filesystem$(pwd) -v /:/home/app/filesystem mynameislau/ranger --choosedir=/mnt/rangerinfos/.rangerdir && docker rm ranger && cd $(docker run --mount source=rangerinfos,destination=/mnt/rangerinfos --name rangercat alpine cat /mnt/rangerinfos/.rangerdir | sed "s,/home/app/filesystem,,"); docker rm rangercat && docker volume rm rangerinfos'