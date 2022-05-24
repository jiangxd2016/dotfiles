

var fs = require('fs');
var path = require('path');

// git 项目读取的文件夹
const findDir = "Documents"

// 书签位置
const chromeDir = 'Library/Application Support/Google/Chrome/Default/'

const USER_HOME = process.env.HOME || process.env.USERPROFILE
const dir = path.join(USER_HOME,findDir);
const outDir =  path.join(__dirname,"./cache");
const BookmarksFilePath = path.join(USER_HOME,chromeDir,"Bookmarks");

function isGitSync(dir) {
  return fs.existsSync(path.join(dir, '.git'))
}

const filesList = [];
const bookMarKList = []

function readFileList(dir) {
  const files = fs.readdirSync(dir);
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



function loadBookMarks(){
  const bookmarks = fs.readFileSync(BookmarksFilePath).toString();
  const bookmarksList = JSON.parse(bookmarks);
  const bookmark_bar = bookmarksList.roots.bookmark_bar

  readBookMarks(bookmark_bar);
}


function readBookMarks(bar){
  if(Array.isArray(bar)){
    bar.forEach(item=>{
      if(item.url){
        bookMarKList.push(item)
      }
      if(item.children){
        readBookMarks(item.children)
      }
    })
  }
  else if(bar.children){
    bar.children.forEach(item=>{
      if(item.type == 'url'){
        bookMarKList.push(item)
      }else{
        readBookMarks(item);
      }
    })
  }

}
function setGitLuaFile(){
  readFileList(dir);
  const str  = `gitfile = {
    ${filesList.map(item=>`{name="${item.name}",path="${item.path}"}`).join(',')}
      }`;

  fs.writeFileSync(path.join(outDir,"git.lua"),str,{encoding:'utf8',flag:'w'});
}


function setBookMarksLuaFile(){
  loadBookMarks();
  const str  = `bookmarks = {
    ${bookMarKList.map(item=>`{name="${item.name}",url="${item.url}"}`).join(',')}
      }`;
   fs.writeFileSync(path.join(outDir,"bookmarks.lua"),str,{encoding:'utf8',flag:'w'});
}   

console.log(path.join(outDir,"bookmarks.lua"));
setGitLuaFile()
setBookMarksLuaFile()
