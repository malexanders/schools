# rspec config

Error
```
==> rails generate rspec:install
Running via Spring preloader in process 18157
Could not find generator 'rspec:install'. Maybe you meant 'assets', 'scaffold' or 'css:assets'
Run `rails generate --help` for more options.

```
Solution
```
==> spring stop
Spring stopped.

/Users/Macbook/projects/schools
==> rails generate rspec:install
Running via Spring preloader in process 18233
      create  .rspec
      create  spec
      create  spec/spec_helper.rb
      create  spec/rails_helper.rb
```

Q: Why did `spring stop` solve this problem?
___
