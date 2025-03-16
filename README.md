# kvm-compile
Docker compilation container for KVM programs

# Create a compilation container
```sudo docker run -tid --net=host -v /home/test:/root --name kvm-build 784432821/giso-compiler /bin/bash```  
```sudo docker exec -ti kvm-build /bin/bash```  


# Build the program
```cd /root/kvm```  
```./build.sh```  

