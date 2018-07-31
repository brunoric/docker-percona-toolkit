docker-percona-toolkit status
-----------------------------

![circleci-master-build](https://circleci.com/gh/brunoric/docker-percona-toolkit/tree/master.png?style=shield)

docker-percona-toolkit
----------------------

Alpine Docker image to run [Percona Toolkit commands][percona-toolkit].

pt-align

pt-archiver

pt-config-diff

pt-deadlock-logger

pt-diskstats

pt-duplicate-key-checker

pt-fifo-split

pt-find

pt-fingerprint

pt-fk-error-logger

pt-heartbeat

pt-index-usage

pt-ioprofile

pt-kill

pt-mext

pt-mongodb-query-digest

pt-mongodb-summary

pt-mysql-summary

pt-online-schema-change

pt-pmp

pt-query-digest

pt-show-grants

pt-sift

pt-slave-delay

pt-slave-find

pt-slave-restart

pt-stalk

pt-summary

pt-table-checksum

pt-table-sync

pt-table-usage

pt-upgrade

pt-variable-advisor

pt-visual-explain

How to get?
-----------

**1) Run a container**

The first method of get the images is directly run a container with the desired tag like the example below:

    docker run --rm -it brunoric/percona-toolkit pt-query-digest --help

This command will pull the `:latest` image (if you do not have it already) and execute `pt-query-digest --help` command.

**2) Pull the image**

You can also pull the desired image tag from the Docker Hub with:

    docker pull brunoric/percona-toolkit:3.0.11

This command will pull the image (if you do not have it already) without creating any container like the first method does.

**3) Build it**

Finally you can build the needed image from scratch. You will need to clone `brunoric/percona-toolkit` from GitHub and use Docker build command:

    docker build -t brunoric/percona-toolkit:3.0.11 .

With this method you can also make changes on the Dockerfile fitting the image to your runtime.

How to use?
-----------

Just pass any command as parameter to `docker run --rm -it`:

    docker run --rm -it pt-index-usage -h your.database.host -uyour_user -pyour_pass --database=your_database

You can also create an alias or even a bash function to add:

````sh
# Example function:
function percona-tools()
{
    docker run --rm -it $@;
}
````

With this function you could call:

    percona-tools pt-index-usage -h your.database.host -uyour_user -pyour_pass --database=your_database

Docker Hub
----------
This repository is using [CircleCI][circleci] to run automated builds and send them to the [Docker Hub][registry].

Contributing
------------
If you notice any bug or typo, please feel free to create an issue and/or open a pull request with the fix.

Additional notes
----------------

- [Docker documentation][docker].
- [brunoric at Docker Hub][registry].

[docker]: https://docs.docker.com
[registry]: https://registry.hub.docker.com/u/brunoric
[circleci]: https://circleci.com/gh/brunoric/docker-percona-toolkit
[percona-toolkit]: https://www.percona.com/doc/percona-toolkit/3.0/index.html