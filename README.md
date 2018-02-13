# HOW TO

If you want to be able to quickly access ranger , you can put this in your .bash_profile

```bash

function printrngrdir {
  docker run --mount source=rangerinfos,destination=/mnt/rangerinfos --name rangercat alpine cat /mnt/rangerinfos/.rangerdir | sed "s,/home/app/filesystem,,"
}

function runrngrcontainer {
  docker run -it --name "ranger" --mount type=volume,source=rangerinfos,destination=/mnt/rangerinfos -w /home/app/filesystem$(pwd) -v /:/home/app/filesystem mynameislau/ranger --choosedir=/mnt/rangerinfos/.rangerdir --choosefile=/mnt/rangerinfos/.rangerfile

  docker rm ranger
  cd $(printrngrdir)
  docker rm rangercat > /dev/null
  docker volume rm rangerinfos > /dev/null
}

alias rg="runrngrcontainer"
```