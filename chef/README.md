


## how to use vagrant

### downlaod/get box file, and add box to vagrant

you can get box files from vagrantbox.es. 
or you need to get it from USB . 


if you have centos65.box, you can add the file to vagrant as follows. 

```
vagrant box add centos65.box --name centos65
```

### start vagrant

```
vagrant up 
```


### connect the server

```
vagrant ssh
```


### halt the server
```
vagrant halt
```


### destory the server

```
vagrant destroy
```


