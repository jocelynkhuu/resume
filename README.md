Display resume in Github pages
- Resume is hosted on https://registry.jsonresume.org/jocelynkhuu
- `resume.json` auto updates https://gist.github.com/jocelynkhuu/fdf2c3cbd23f5deda0c802260059b4f6 through github action


https://github.com/rbardini/resumed
- `npm install resumed jsonresume-theme-macchiato`
- `cd /path/to/node_modules/resumed/dist` 
> make sure resume.json is there 
- `resumed render -t jsonresume-theme-macchaito`
- `cat resume.html | xclip` 
> copy to repo
