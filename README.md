# Habitsy

  

> Habitsy is -or will be?- a habit management WebApp.

  

Using habitsy, you'll be able to track how many times you have performed certain activities, divided by type and organized for you. But remember, this was more of a toy.

  

## Built With

  
- Ruby 2.7.1
- Ruby on Rails 6

- HTML/SASS

- JQuery

- SQLite -as a placeholder-
  
  

## Getting Started

  

To get a local copy up and running follow these simple steps.

  

### Prerequisites

  
- Ruby >= 2.7 
- Ruby on Rails >= 6.0.1

- git

- Nodejs >= 12.0

  

### Setup

  

First, clone the repository from github with:

```bash

git clone https://github.com/Chincoya/habitsy.git

```

Then change into the repo's directory with:

  

```bash

cd habitsy

```

You can then proceed to installation.

  

### Install

  

Inside Habitsy directory, run the following commands:

  

```bash

bundle install

rails db:setup

rails db:migrate

```

  

These commands will:

- Install all the packages needed for Parting to run

- Create the database

- Create and migrate the tables needed

  

If everything went right you should be able to run the test suit. And you should. Run:

  

```bash

rails spec

```

  

To do so.

  

### Usage

  

For a local environment -which, admittedly, I don't know what you'll want it for- you should run:

```bash

rails server

```

Or:

  

```bash

rails s

```


### Run tests

  

As was already pointed out, both the commands:

  

```bash

rails spec

rspec

```

  

Will run the test suite. You can check out the tests -and add more if you want- under the ./spec directory.

  

### Deployment

  

There are several options for deployment. Heroku is a good one. To deploy on Heroku: 

  

First, [create a Heroku account](https://signup.heroku.com/login). Then follow [this](https://devcenter.heroku.com/articles/heroku-cli) instructions to download and set up the Heroku CLI -**C**ommand **L**ine **I**nterface. You'll have to setup some ssh credentials unless you want to type them every time you do any heroku command.

  

After installing the Heroku CLI, navigate to Parting's root folder and run:

  

```bash

heroku create the-name-you-want-to-use

```

  

Heroku will create an app in their servers, and wait for you to push your code into it. Run:

  

```bash

git push heroku current-published-branch:master

```

  

**Replacing**  *'current-published-branch'* with the name of the main branch of the App. At the end of this Readme you'll find which branch it is.

  

Heroku will output their wholle process in your command prompt. This can take a while, specially the first time. In heroku your app will be built, compress and minified for production environment.

  

If this step goes right, Heroku will provide you, near the end of the output of the previus command, with the link to your deployed App. **There's still one step you need to take**
  

## Notes

  

### On the state of the project.

Currently, the project is still under heavy developement. Many features are bound to change, and there's still many waiting to be implemented. Refer to the **Contributing** section for more information.

  
  

## Author

  

**Daniel Chincoya**

  

- Github: [@chincoya](https://github.com/chincoya)

- Twitter: [@chincoya7](https://twitter.com/chincoya7)

- Linkedin: [linkedin](https://linkedin.com/in/daniel-chincoya/)

  

## 🤝 Contributing

  

Contributions, issues and feature requests are welcome! But, know in advance, this is a work -not- in process. Hit me up at Twitter if you want to contribute, or start developing and make a Pull Request. Many things a left to do, for example:

  

- Add specs. As many as possible
- Some way of comparing your activities with others
- Maybe a monthly view
- Pagination of the results
- Filtering
- Log-enforcing

  

Feel free to check the [issues page](issues/). Anything there is free reign.

  

## Show your support

  

Give a ⭐️ if you like this project!

Or, even better, make a feature request!

  

## Acknowledgments

Additional Icons fetched from [flaticon.com](https://www.flaticon.com/), authored by:

- Pixel Perfect

- Freelk

- Ddara

  

## License

  

This project is [MIT](lic.url) licensed.

  

### CURRENT WORKING BRANCH:

  

## dev