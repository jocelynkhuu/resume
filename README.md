Display resume in Github pages
- Resume is hosted on https://registry.jsonresume.org/jocelynkhuu
- `resume.json` auto updates https://gist.github.com/jocelynkhuu/fdf2c3cbd23f5deda0c802260059b4f6 through [github action](https://github.com/thomasdavis/resume)

Use [Resumed](https://github.com/rbardini/resumed)
- `npm install resumed jsonresume-theme-macchiato`
- `cd /path/to/node_modules/resumed/dist` (~/node_modules)
  - make sure `resume.json` is there as this is what you will edit to update
- `resumed render -t jsonresume-theme-macchiato`
- `cat resume.html | xclip`
  - copy to repo
  - `cat resume.html > ~/github/resume/index.html` 
- Copy `resume.json` from `node_modules` to this repo for backup
  - `cat resume.json > ~/github/resume/resume.json`
