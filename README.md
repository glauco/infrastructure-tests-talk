# Infrastructure Tests Talk

This is an example of how to test your infrastructure.

The presentation slides are available in [here](http://www.slideshare.net/glaucovinicius/infrastructure-testing).

## Requirements

* A text editor
* [Ruby](https://www.ruby-lang.org)
* [Virtualbox](https://www.virtualbox.org/)
* [Vagrant](https://vagrantup.com)
* Internet connection

## Setting up the environment

```bash
$ bundle install
...

Bundle complete! 10 Gemfile dependencies, 119 gems now installed.
Use `bundle show [gemname]` to see where a bundled gem is installed.
```

## Running unit tests

```bash
$ bundle exec rspec test/unit
......

Finished in 1.67 seconds (files took 7.1 seconds to load)
6 examples, 0 failures
```

## Running provisioning tests

```bash
$ bundle exec kitchen test
-----> Starting Kitchen (v1.10.2)
-----> Cleaning up any prior instances of <default-centos-71>
...

  ✔  System Package httpd should be installed
  ✔  Service httpd should be installed

Summary:   3 successful    0 failures    0 skipped
       Finished verifying <default-centos-71> (0m1.23s).
-----> Destroying <default-centos-71>...
       ==> default: Forcing shutdown of VM...
       ==> default: Destroying VM and associated drives...
       Vagrant instance <default-centos-71> destroyed.
       Finished destroying <default-centos-71> (0m5.15s).
       Finished testing <default-centos-71> (1m59.14s).
```

### Listing your provisioning test instances

```bash
$ bundle exec kitchen list
Instance             Driver   Provisioner  Verifier  Transport  Last Action
default-centos-71    Vagrant  ChefZero     Inspec    Ssh        <Not Created>
default-ubuntu-1404  Vagrant  ChefZero     Inspec    Ssh        <Not Created>
```

### Applying your recipe and testing it on a specific instance

```bash
$ bundle exec kitchen test default-centos-71
-----> Starting Kitchen (v1.10.2)
-----> Cleaning up any prior instances of <default-centos-71>
...

  ✔  System Package httpd should be installed
  ✔  Service httpd should be installed

Summary:   3 successful    0 failures    0 skipped
       Finished verifying <default-centos-71> (0m1.23s).
-----> Destroying <default-centos-71>...
       ==> default: Forcing shutdown of VM...
       ==> default: Destroying VM and associated drives...
       Vagrant instance <default-centos-71> destroyed.
       Finished destroying <default-centos-71> (0m5.15s).
       Finished testing <default-centos-71> (1m59.14s).
```
