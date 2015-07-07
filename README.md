## Basic Idea

See: http://middlemanapp.com/

Static site, run the preview server locally while developing, then compile it
and push it to the server via ftp.

Rather than making changes through a CMS, you just edit the code and commit it.

## Setup

- Pull down the project `git clone git@github.com:hyfn/hyfn8-corporate.git`
- Navigate into it: `cd hyfn8-corporate`
- Install dependencies: `bundle install`
- Run the server: `middleman`
- You can access the project at `http://localhost:4567/`

## Commands

- `middleman` - Starts the preview server at http://localhost:4567/
- `middleman build` - Compiles the site into the "build" folder.
- `middleman help` - Show a list of all commands.
- `middleman sync` - Deploys the build folder to S3 (staging.)
- `middleman deploy` - Deploys the build folder to prod.

Be sure to push changes to git as well.

## Structure

### Top Level

- `source` directory - This is the non-compiled stuff that you edit.
- New pages go in the top level of the source folder. URLs correspond the the file name - `work.html.erb` is at `/work/`
- `build` directory - This is the generated static site. This gets deployed. Don't edit it directly.
- `config.rb` - Configuration file for the site.
- Files starting with an underscore aren't compiled. So partials and files included in other files should start with an underscore.

### Assets

- All css/js assets are loaded on every page.
- Only `all.css.scss`, `all.js.cofee` and `head.js.coffee` have corresponding compiled files. All other css/js files are concatenated into these.
- CSS - one stylesheet for each page, and distinct components get their own files. Additionally, the `css/_common.css.scss` contains styles for common elements, and `css/_layout.css.scss` contains styles for the elements in `layout.erb`.
- When referring to image paths in code, always use a helper. Use image-url("path.png") in css and <%= image_tag "path.png" %> in html.

### Disabling Things

- Putting an underscore at the beginning of the file name will usually do it.


## Deployment

### Staging

Currently pushes to S3. Do it like this:

- copy `data/sync.sample.yml` to `data/sync.yml` and update the values
- run `middleman build`
- run `middleman sync`
- go to http://hyfn8-corporate.s3-website-us-east-1.amazonaws.com/

### Production

- add your public key to the prod server (ask daniel@hyfn.com or katharine@hyfn.com)
- run `middleman build`
- run `middleman sync`
- go to http://hyfn8.com
