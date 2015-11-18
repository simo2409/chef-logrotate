logrotate Cookbook
==================
This cookbook users [logrotate cookbook](https://github.com/cookbooks/logrotate) to setup
some logrotate jobs focused on rails applications, nginx and MariaDB.

Requirements
------------
#### packages
- `logrotate` - [logrotate cookbook](https://github.com/cookbooks/logrotate)

Attributes
----------
This cookbook is far from to be defined flexible, honestly.
To customize it (a little bit) check `attributes/default.rb`.

Usage
-----
#### logrotate::default
Just include `logrotate` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[logrotate]"
  ],
  "logrotate": {
    "global": {
      "weekly": false,
      "daily": true
    }
  }
}
```

Contributing
------------
This recipe is highly not complete, until it will be more completed it's not worth to contribute on it.

License and Authors
-------------------
License: MIT

Authors:

Simone Dall'Angelo
