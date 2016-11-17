Big Bang Shell Script
=====================

Initial shell script after installing Ubuntu 16.04 on sever. It is the start point. As the Bing Bang.

Usage
=====

    curl -sSf https://bbsh.github.io/bb.sh | bash

Modules
=======

In order to run selected module only use:

    curl -sSf https://bbsh.github.io/bb.sh | bash -s -- <module>

- `apt` &mdash; update an install required software from apt repositories

        curl -sSf https://bbsh.github.io/bb.sh | bash -s -- apt
        
- `users` &mdash; create sudoer and 'www' user

        curl -sSf https://bbsh.github.io/bb.sh | bash -s -- users

License
=======

[MIT](./LICENSE)
