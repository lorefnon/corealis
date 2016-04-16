# Corealis

[![Build Status](https://travis-ci.org/lorefnon/corealis.svg?branch=master)](https://travis-ci.org/lorefnon/corealis) [![Code Climate](https://codeclimate.com/github/lorefnon/corealis/badges/gpa.svg)](https://codeclimate.com/github/lorefnon/corealis) [![Test Coverage](https://codeclimate.com/github/lorefnon/corealis/badges/coverage.svg)](https://codeclimate.com/github/lorefnon/corealis/coverage) [![Stories in Ready](https://badge.waffle.io/lorefnon/corealis.png?label=ready&title=Ready)](https://waffle.io/lorefnon/corealis) [![Join the chat at https://gitter.im/lorefnon/corealis](https://badges.gitter.im/lorefnon/corealis.svg)](https://gitter.im/lorefnon/corealis?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Minimal Rails application for managing openings, applications and orchestrating web based programming interviews for startups.

![Screenshot](https://raw.githubusercontent.com/lorefnon/corealis/master/docs/home_screenshot.png)

![Screenshot](https://raw.githubusercontent.com/lorefnon/corealis/master/docs/corealis_quiz_mgmt_screenshot.png)

## Status

While Corealis is not yet feature complete - the core functionalities are stable and usable.

Suggestions and pull requests for implementing new features, stability
enhancements or improving test coverage are more than welcome.

### Demo

A demo app hosted on heroku is available [here](http://corealis-demo.herokuapp.com/).

Admin interface is available at `/admin` and can be accessed with username: `admin@corealis.in` and password: `password`

## Key Features

- A careers page with a listing of Showcased openings
- Facility to apply to open positions.
- Backend admin interface to manage openings, view applications and schedule interviews and dispatch invitations
- Conduct pre-scripted preliminary interviews online
- View user submissions replayed the way applicant had entered the answer -
giving full visibility into the process of deduction of the solution.

## Deployment

- A Dockerfile is available for deploying on Docker
- Corealis is [Heroku](https://heroku.com) friendly. You can deploy directly to heroku using this button:

  [![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

## Credits

This project would not be possible without these amazing open source projects

- [ActiveAdmin](https://github.com/activeadmin/activeadmin)
- [Ruby on Rails](https://github.com/rails/rails)
- [Ruby](https://github.com/ruby/ruby)

## License

[![GPL V3](http://www.gnu.org/graphics/gplv3-88x31.png)](http://www.gnu.org/licenses/quick-guide-gplv3.pdf)

Corealis is made available under GPL V3 License.

    Copyright (C) 2016 Gaurab Paul

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
