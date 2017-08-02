## To caculate the code coverage of a linux kernel module by GCOV & LCOV

Let me take e1000 network driver module as an example. The path of its code in linux source package is /linux-x.x.x/drivers/net/ethernet/intel/e1000. 

### Re-compile the kernel with GCOV functionality enabled.
I recommand you to use "make menuconfig" to configure the GCOV functionatity. Follow [here](https://medium.freecodecamp.org/building-and-installing-the-latest-linux-kernel-from-source-6d8df5345980) to recompile a linux kernel and install it. When you enter:
```
sudo make menuconfig
```
you'll come into a config GUI. Follow [these](https://github.com/DanielYubinFan/Kernel_Modules_Coverage/issues/1) images to enable GCOV utilities. 
Then re-make and re-install the whole kernel.

### Instrument the code with GOCV flags
Add GCOV compliation flags into e1000's Makefile. 
```
GCOV_PROFILE := y
CCFLAGS = -ftest-coverage -fprofile-arcs
export CCFLAGS
```

### Installing

A step by step series of examples that tell you have to get a development env running

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone who's code was used
* Inspiration
* etc
