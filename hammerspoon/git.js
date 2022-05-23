

var fs = require('fs');
var path = require('path');


const findDir = "Documents"

const USER_HOME = process.env.HOME || process.env.USERPROFILE
const dir = path.join(USER_HOME,findDir);
const outFile =  path.join(__dirname,"./modules","git.lua");

function isGitSync(dir) {
  return fs.existsSync(path.join(dir, '.git'))
}

var filesList = [];


function readFileList(dir) {
  const files = fs.readdirSync(dir);
  console.log(files);
  files.forEach((item) => {
    if(item === 'node_modules')
      return;
    var fullPath = path.join(dir, item);
    const stat = fs.statSync(fullPath);
    if (stat.isDirectory()) {
      // only read one level
      if(isGitSync(fullPath)){
        filesList.push({name:item,path:fullPath});
        return
      }
      readFileList(path.join(dir, item)); //递归读取文件
    } 
  });
  return filesList;
}


function setGitLuaFile(){
  readFileList(dir);
  const str  = `gitfile = {
    ${filesList.map(item=>`{name="${item.name}",path="${item.path}"}`).join(',')}
      }`;

  fs.writeFileSync(outFile,str);
}
seGitLuaFile()
