
//定义id选择器
function Id(id) {
    return document.getElementById(id);
}
function changeToop(file) {
    var file = Id("file");
    verificationPicFile(file)
    if (file.value == '') {
        //设置默认图片

        Id("myimg").src = '../img/up.png';
    } else {

        preImg("file", "myimg");
    }
}
//获取input[file]图片的url Important
function getFileUrl(fileId) {
    var url;
    var file = Id(fileId);
    var agent = navigator.userAgent;
    if (agent.indexOf("MSIE") >= 1) {
        url = file.value;
    } else if (agent.indexOf("Firefox") > 0) {
        url = window.URL.createObjectURL(file.files.item(0));
    } else if (agent.indexOf("Chrome") > 0) {
        url = window.URL.createObjectURL(file.files.item(0));
    }
    return url;
}
//读取图片后预览
function preImg(fileId, imgId) {
    var imgPre = Id(imgId);
    imgPre.src = getFileUrl(fileId);
}
//图片类型/大小验证
function verificationPicFile(file) {
    var fileSize = 0;
    var fileMaxSize = 1024 * 2;//1M
    var filePath = file.value;
    var fileTypes = [".jpg", ".png"];
    var filePath = file.value;
    if (filePath) {
        fileSize = file.files[0].size;
        var size = fileSize / 1024;
        if (size > fileMaxSize) {
            alert("文件大小不能大于2M！");
            file.value = "";
            return false;
        } else if (size <= 0) {
            alert("文件大小不能为0M！");
            file.value = "";
            return false;
        }
    } else {
        //当括号里面的值为0、空字符、false 、null 、undefined的时候就相当于false
        if (filePath) {
            var isNext = false;
            var fileEnd = filePath.substring(filePath.indexOf("."));
            for (var i = 0; i < fileTypes.length; i++) {
                if (fileTypes[i] == fileEnd) {
                    isNext = true;
                    break;
                }
            }
            if (!isNext) {
                alert('不接受此文件类型');
                file.value = "";
                return false;
            }
        } else {
            return false;
        }
    }
}

