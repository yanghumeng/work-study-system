
(function(factory) {
  if (typeof define === 'function' && define.amd) {
    // AMD module
    define(['jquery'], factory);
  } else if (typeof module !== "undefined" && module.exports) {
    // Node/CommonJS
    // Seajs build
    factory(require('jquery'));
  } else {
    // 浏览器全局模式
    factory(jQuery);
  }
})(function($) {
  var closeClass = '.j_dialogClose';

  // 默认参数配置
  var dialogDef = {
    id: '', // 如果页面中存在多个样式的弹窗，可用ID区别样式
    title: 'Title',
    isFixed: true,
    hideHeader: false,
    hideClose: false,
    content: null,
    callback: null,
    withNoPadding: false, // 是否不设置padding
    withNoMinWidth: false, // 是否不设置最小宽度
    bgHide: true, // 点击背景是否隐藏
    escHide: true // 按ESC按键是否隐藏
  };

  // 全局变量
  var dialogConfig = {
    windows: $(window),
    lightbox: '.dialog-background',
    section: '.dialog-section',
    imageTag: '.dialog-imageitem',
    imageData: {},
    width: 0,
    height: 0,
    left: 0,
    top: 0,
    paddingWidth: 0,
    paddingHeight: 0,
    resizeParams: ['.dialog-section']
  };

  // 用户传递过来的参数集
  var dialogOpts = {};

  // 基础实现
  var Dialog = {
    /**
     * 显示dialog弹窗
     * @param  {Object} opts 配置选项
     * @return {undefined}
     */
    show: function(opts) {
      dialogOpts = $.extend({}, dialogDef, opts || {});

      if (opts.content) {
        Dialog.dialog(opts);
      } else {
        Dialog.lightbox(opts);
      }

      // 初始化时执行的回调函数
      typeof dialogOpts.onInit === 'function' && dialogOpts.onInit();

      // 改变浏览器大小时，动态改变内容显示盒子的位置
      dialogConfig.windows.on('resize', function() {
        Dialog.settings.apply(window, dialogConfig.resizeParams);
      });
    },

    /**
     * 关闭dialog弹窗
     * @param  {Function} callback 回调函数
     * @return {undefined}
     */
    hide: function(callback) {
      var oLightBox = $(dialogConfig.lightbox);
      var oSection = $(dialogConfig.section);

      if (dialogOpts.isFixed) {
        oSection.animate({
          marginTop: -(dialogConfig.top - 150),
          opacity: 0
        });
      } else {
        oSection.animate({
          top: (dialogConfig.top + 150),
          opacity: 0
        });
      }

      oLightBox.fadeOut(function() {
        oLightBox.remove();
        oSection.remove();
        callback && callback();
      });
    },

    dialog: function(opts) {
      Dialog.install(opts);
      dialogConfig.resizeParams = [dialogConfig.section, true, true];
      Dialog.settings.apply(window, dialogConfig.resizeParams);
    },

    lightbox: function(opts) {
      var clickObj_src = opts.clickObj.attr('data-src') || opts.clickObj.attr('data-image');
      dialogConfig.now = 0;
      Dialog.getImages_src(dialogOpts.imagelist);
      Dialog.loadImage(clickObj_src, true, Dialog.settings);
      Dialog.getNow(clickObj_src);
    },

    install: function(opts) {
      var oBody = $('body');
      var headerHtml = '<div class="dialog-header">' + dialogOpts.title + '</div>';
      var closeHtml = '<div class="dialog-close j_dialogClose"></div>';
      var markId = '';
      var addClass = '';
      var $background = oBody.find(dialogConfig.lightbox);

      if (!dialogOpts.content) {
        var content = '<div class="dialog-imagelist">' + '  <img src="" class="dialog-imageitem" />' + '</div>' + '  ' + '<span class="dialog-btnPrev">&lt;</span>' + '<span class="dialog-btnNext">&gt;</span>';
      } else {
        var content = dialogOpts.content;
      }

      if (dialogOpts.hideHeader) {
        headerHtml = '';
      }

      if (dialogOpts.hideClose) {
        closeHtml = '<div class="dialog-close j_dialogClose" style="display: none;"></div>';
      }

      if (dialogOpts.id) {
        markId = ' id="' + dialogOpts.id + '"';
      }

      var plugs_lightbox = '<div class="dialog-background' + (dialogOpts.bgHide ? ' j_bgHide' : '') + '"></div>';
      var plugs_lightbox_section = '<div class="dialog-section' + (dialogOpts.escHide ? ' j_escHide' : '') + '" ' + markId + '>' + headerHtml + '<div class="dialog-body' + (dialogOpts.withNoPadding ? ' withNoPadding' : '') + (dialogOpts.withNoMinWidth ? ' withNoMinWidth' : '') + '">' + content + '</div>' + closeHtml + '</div>';

      // 如果之前有打开弹窗，先将其关闭
      if ($background.length) {
        $background.stop().fadeIn();
        oBody.find(dialogConfig.section).remove();
      } else {
        oBody.append(plugs_lightbox)
      }

      oBody.append(plugs_lightbox_section);
      $(dialogConfig.lightbox).fadeIn();
      $(dialogConfig.section).show();

      var iPaddingWidth = $(dialogConfig.section).outerWidth() - $(dialogConfig.section).width();
      var iPaddingHeight = $(dialogConfig.section).outerHeight() - $(dialogConfig.section).height();

      dialogConfig.paddingWidth = iPaddingWidth;
      dialogConfig.paddingHeight = iPaddingHeight;
      dialogOpts.callback && dialogOpts.callback();
    },

    getNow: function(loadImage_src) {
      for (var i = 0, len = dialogConfig.images.length; i < len; i++) {
        if (loadImage_src === dialogConfig.images[i]) {
          dialogConfig.now = i;
        }
      }
    },

    getImages_src: function(images) {
      var images = (typeof images == 'string') ? $(images) : images;
      dialogConfig.images = [];

      for (var i = 0, len = images.length; i < len; i++) {
        var currentImage = images.eq(i);
        var currentImage_src = currentImage.attr('data-src') || currentImage.attr('data-image');
        var currentImage_src = $.trim(currentImage_src);
        if (currentImage_src !== '') {
          dialogConfig.images.push(currentImage_src);
        }
      }
    },

    loadImage: function(loadImage_src, isMove, callback) {
      var image = new Image();
      image.onload = function() {
        if ($('.dialog-section').length === 0) {
          Dialog.install(dialogOpts);
          $('.dialog-btnPrev').on('click', function() {
            Dialog.switchImage(false, false);
          });
          $('.dialog-btnNext').on('click', function() {
            Dialog.switchImage(true, false);
          });
        }

        Dialog.setBtnSate();

        var section = $(dialogConfig.section);
        var imageTag = $(dialogConfig.imageTag);

        dialogConfig.imageData = {
          width: this.width,
          height: this.height,
          src: loadImage_src
        };

        dialogConfig.resizeParams = [section, imageTag, isMove];
        callback && callback.apply(window, dialogConfig.resizeParams);
      }
      image.src = loadImage_src;
    },

    switchImage: function(d, isMove) {
      if (d) {
        dialogConfig.now++;
      } else {
        dialogConfig.now--;
      }

      if (dialogConfig.now < 0) {
        dialogConfig.now = dialogConfig.images.length - 1;
      }

      if (dialogConfig.now > dialogConfig.images.length - 1) {
        dialogConfig.now = 0;
      }

      var loadImage_src = dialogConfig.images[dialogConfig.now];
      Dialog.loadImage(loadImage_src, isMove, Dialog.settings);
    },

    setBtnSate: function() {
      if (dialogConfig.images.length < 2) {
        $('.dialog-btnPrev, .dialog-btnNext').hide();
      }
    },

    // 设置内容显示盒子的大小，位置
    settings: function(section, imageTag, isMove) {
      var section = (typeof section == 'string') ? $(section) : section;
      var winHeight = $(window).height();

      if (!dialogOpts.content) {
        var sectionHeight = 116, // 外围容器默认的高度，为了方便，这里暂时使用固定值，后期改版再做调整
          configWidth = dialogConfig.imageData.width,
          configHeight = dialogConfig.imageData.height;
        dialogConfig.width = configWidth;
        dialogConfig.height = configHeight;
        if (sectionHeight + dialogConfig.height > winHeight) {
          dialogConfig.height = winHeight - sectionHeight - 50;
          dialogConfig.height = dialogConfig.height < 500 ? 500 : dialogConfig.height;
          dialogConfig.width = Math.round(dialogConfig.width * (dialogConfig.height / configHeight));
        }
      } else {
        section.css({
          left: '0px'
        }); // 固定布局时，容器的left应该为0，样式文件不好修改，暂时在这里调整
        dialogConfig.width = section.width();
        dialogConfig.height = section.height();
      }

      var outerWidth = dialogConfig.width + dialogConfig.paddingWidth;
      var outerHeight = dialogConfig.height + dialogConfig.paddingHeight + $('.dialog-header').outerHeight();

      if (typeof imageTag === 'object') {
        imageTag.hide().attr('src', dialogConfig.imageData.src).css({
          width: dialogConfig.width,
          height: dialogConfig.height
        }).fadeIn();
      }

      if (dialogOpts.isFixed) {
        dialogConfig.left = Math.floor(outerWidth / 2);
        dialogConfig.top = Math.floor(outerHeight / 2);
        section.css({
          position: 'fixed',
          left: '50%'
        });

        if (isMove) {
          section.css({
            marginLeft: -dialogConfig.left,
            marginTop: -dialogConfig.top
          });
        } else {
          section.animate({
            marginLeft: -dialogConfig.left,
            marginTop: -dialogConfig.top
          }, {
            queue: false
          });
        }
      } else {
        var scrollLeft = dialogConfig.windows.scrollLeft();
        var scrollTop = dialogConfig.windows.scrollTop();
        var windowWidth = $(dialogConfig.lightbox).width();

        dialogConfig.left = Math.floor((windowWidth - outerWidth) / 2) + scrollLeft;
        dialogConfig.top = Math.floor((winHeight - outerHeight) / 2) + scrollTop;
        section.css({
          position: 'absolute',
          marginLeft: 0,
          marginTop: 0
        });

        if (isMove) {
          section.css({
            left: dialogConfig.left,
            top: dialogConfig.top
          });
        } else {
          section.animate({
            left: dialogConfig.left,
            top: dialogConfig.top
          }, {
            queue: false
          });
        }
      }

      if (imageTag) {
        Dialog.move(section, isMove);
      }
    },

    // 显示时的动画效果
    move: function(section, isMove) {
      if (dialogOpts.isFixed && isMove) {
        section.css({
          marginTop: -(dialogConfig.top - 150)
        }).animate({
          marginTop: -dialogConfig.top,
          opacity: 1
        }, function() {
          section.css('overflow', 'visible');
        });
      } else if (isMove) {
        section.css({
          top: (dialogConfig.top + 150)
        }).animate({
          top: dialogConfig.top,
          opacity: 1
        }, function() {
          section.css('overflow', 'visible');
        });
      }

      section.animate({
        width: dialogConfig.width
      }, {
        queue: false
      });
    },

    // 取消默认事件
    cancelDefault: function(e) {
      e.preventDefault();
      e.stopPropagation();
    }
  };

  // 弹窗类公共处理函数封装
  $.extend({
    /**
     * 发送成功的提示框（置顶）
     * @param  {String}   msg      提示语
     * @param  {Number}   duration 持续多长时间后关闭
     * @param  {Function} callback 回调函数
     * @return {undefined}
     */
    sendSuccessToTop: function(msg, duration, callback) {
      var content = '<div class="dialog-success-top">' + '    <i class="i-icon"></i>' + msg + '</div>';

      $('body').append(content);

      var $tipBox = $('.dialog-success-top'),
          width = $tipBox.width();

      $tipBox.css({
        'margin-left': -(width / 2),
        'margin-top': 20,
        'opacity': 0
      });

      $tipBox.animate({
        'opacity': 1,
        'margin-top': 0
      }, 400, function() {
        // 自动隐藏
        clearTimeout(window.cc_timerSendSuccessToTop);
        window.cc_timerSendSuccessToTop = setTimeout(function() {
          $tipBox.fadeOut(function() {
            $tipBox.remove();
            typeof callback === 'function' && callback();
          })
        }, duration || 3000);
      });
    },

    /**
     * 发送警告的提示框（置顶）
     * @param  {String}   msg      提示语
     * @param  {Number}   duration 持续多长时间后关闭
     * @param  {Function} callback 回调函数
     * @return {undefined}
     */
    sendWarningToTop: function(msg, duration, callback) {
      var content = '<div class="dialog-warning-top">' + '    <i class="i-icon"></i>' + msg + '</div>';

      $('body').append(content);

      var $tipBox = $('.dialog-warning-top'),
          width = $tipBox.width();

      $tipBox.css({
        'margin-left': -(width / 2),
        'margin-top': 20,
        'opacity': 0
      });

      $tipBox.animate({
        'opacity': 1,
        'margin-top': 0
      }, 400, function() {
        // 自动隐藏
        clearTimeout(window.cc_timerSendWarningToTop);
        window.cc_timerSendWarningToTop = setTimeout(function() {
          $tipBox.fadeOut(function() {
            $tipBox.remove();
            typeof callback === 'function' && callback();
          });
        }, duration || 3000);
      });
    },

    /**
     * 发送提示信息
     * @param  {String}   msg      提示语
     * @param  {Number}   duration 持续多长时间后关闭
     * @param  {Function} callback 回调函数
     * @param  {string}   iconStr  icon内容
     * @return {undefined}
     */
    sendMsg: function(msg, duration, callback, iconStr) {
      // 缺省duration参数
      if ($.isFunction(duration)) {
        callback = duration;
        duration = undefined;
      }

      var content = '<div class="dialog-msg">' + '    <div class="dialog-msg-text">' + (iconStr || '') + msg + '</div>' + '</div>';

      var _options = {
        id: 'dialogTipBox',
        title: ' ',
        hideHeader: true,
        hideClose: false,
        content: content,
        callback: duration === false ? null : function() {
          // 自动隐藏
          clearTimeout(window.timerDialogHide);
          window.timerDialogHide = setTimeout(function() {
            $(closeClass).trigger('click');
          }, duration || 3000);
        },
        onClose: function() {
          typeof callback === 'function' && callback();
        }
      };

      Dialog.show(_options);
    },

    /**
     * 发送成功（弹窗）
     * @param  {String}   msg      提示语
     * @param  {Number}   duration 持续多长时间后关闭
     * @param  {Function} callback 回调函数
     * @return {undefined}
     */
    sendSuccess: function(msg, duration, callback) {
      $.sendMsg(msg, duration, callback, '<i class="i-success"></i>');
    },

    /**
     * 发送警告（弹窗）
     * @param  {String}   msg      提示语
     * @param  {Number}   duration 持续多长时间后关闭
     * @param  {Function} callback 回调函数
     * @return {undefined}
     */
    sendWarning: function(msg, duration, callback) {
      $.sendMsg(msg, duration, callback, '<i class="i-warning"></i>');
    },

    /**
     * 发送错误（弹窗）
     * @param  {String}   msg      提示语
     * @param  {Number}   duration 持续多长时间后关闭
     * @param  {Function} callback 回调函数
     * @return {undefined}
     */
    sendError: function(msg, duration, callback) {
      $.sendMsg(msg, duration, callback, '<i class="i-error"></i>');
    },

    /**
     * 发送确认提示框
     * @param  {Object} options 配置选项
     * @return {undefined}
     */
    sendConfirm: function(options) {
      // 配置选项合并
      options = $.extend(true, {
        id: 'dialogConfirmBox',
        title: '提示框',
        hideHeader: false,
        hideClose: false,
        withCenter: false, // 是否水平居中
        withIcon: false, // 是否显示icon，可传递withIcon的替代类名
        autoClose: false, // 是否自动关闭
        timeout: 3000, // 多少毫秒之后自动关闭
        width: null, // 自定义宽度
        noconfirm: false, // 提交按钮是否添加noconfirm属性
        msg: '', // 提示语
        desc: '', // 描述文本
        content: '', // 自定义内容
        button: {
          confirm: '确认', // 确认按钮-标题，null表示不显示，可以通过{text:'按钮文本', href:'按钮链接', target:'链接打开方式',behavior:'是否执行行为'}进行自定义设置
          cancel: '取消', // 取消按钮-标题，null表示不显示，可以通过{text:'按钮文本', href:'按钮链接', target:'链接打开方式',behavior:'是否执行行为'}进行自定义设置
          cancelFirst: false // 取消狂是否在前面
        }
      }, options);

      // 是否显示按钮
      var confirmValue = options.button.confirm,
        cancelValue = options.button.cancel,
        isShowButton = options.button && (confirmValue || cancelValue),
        buttonConfirm = '',
        buttonCancel = '',
        buttonContent = '',
        appendClass = '',
        appendStyle = '';

      if (isShowButton) {
          if (options.title == "修改信息")
          {
              buttonConfirm = (confirmValue ? '<a href="' + (confirmValue.href || 'javascript:void(0);') + '" target="' + (confirmValue.target || '_self') + '" class="dialog-submit' + (confirmValue.behavior === false ? '' : ' j_dialogConfirm_c_m') + '"' + (options.noconfirm ? ' noconfirm="noconfirm"' : '') + '>' + (confirmValue.text || confirmValue) + '</a>' : '');
              buttonCancel = (cancelValue ? '<a href="' + (cancelValue.href || 'javascript:void(0);') + '" target="' + (cancelValue.target || '_self') + '" class="dialog-cancel' + (cancelValue.behavior === false ? '' : ' j_dialogCancel') + '">' + (cancelValue.text || cancelValue) + '</a>' : '');
              buttonContent = '<div class="dialog-buttonBox">' + (options.button.cancelFirst ? buttonCancel + buttonConfirm : buttonConfirm + buttonCancel) + '</div>'
          }
          if (options.title == "修改密码") {
              buttonConfirm = (confirmValue ? '<a href="' + (confirmValue.href || 'javascript:void(0);') + '" target="' + (confirmValue.target || '_self') + '" class="dialog-submit' + (confirmValue.behavior === false ? '' : ' j_dialogConfirm_c_p') + '"' + (options.noconfirm ? ' noconfirm="noconfirm"' : '') + '>' + (confirmValue.text || confirmValue) + '</a>' : '');
              buttonCancel = (cancelValue ? '<a href="' + (cancelValue.href || 'javascript:void(0);') + '" target="' + (cancelValue.target || '_self') + '" class="dialog-cancel' + (cancelValue.behavior === false ? '' : ' j_dialogCancel') + '">' + (cancelValue.text || cancelValue) + '</a>' : '');
              buttonContent = '<div class="dialog-buttonBox">' + (options.button.cancelFirst ? buttonCancel + buttonConfirm : buttonConfirm + buttonCancel) + '</div>'
          }
          if (options.title == "用户反馈")
          {
              buttonConfirm = (confirmValue ? '<a href="' + (confirmValue.href || 'javascript:void(0);') + '" target="' + (confirmValue.target || '_self') + '" class="dialog-submit' + (confirmValue.behavior === false ? '' : ' j_dialogConfirm') + '"' + (options.noconfirm ? ' noconfirm="noconfirm"' : '') + '>' + (confirmValue.text || confirmValue) + '</a>' : '');
              buttonCancel = (cancelValue ? '<a href="' + (cancelValue.href || 'javascript:void(0);') + '" target="' + (cancelValue.target || '_self') + '" class="dialog-cancel' + (cancelValue.behavior === false ? '' : ' j_dialogCancel') + '">' + (cancelValue.text || cancelValue) + '</a>' : '');
              buttonContent = '<div class="dialog-buttonBox">' + (options.button.cancelFirst ? buttonCancel + buttonConfirm : buttonConfirm + buttonCancel) + '</div>'
          }
      }

      if (options.withCenter) {
        appendClass += ' withCenter';
      }

      if (options.withIcon) {
        appendClass += ' ' + (typeof options.withIcon === 'string' ? options.withIcon : 'withIcon');
      }

      if (options.width !== null) {
        appendStyle = ' style="width:' + options.width + (typeof options.width === 'string' ? '' : 'px') + ';"';
      }

      // 弹窗内容
      var content = '<div class="dialog-confirm' + appendClass + '"' + appendStyle + '>' + (options.msg === '' ? '' : '<div class="dialog-msg">' + options.msg + '</div>') + (options.desc === '' ? '' : '<div class="dialog-desc">' + options.desc + '</div>') + (options.content === '' ? '' : '<div class="dialog-content">' + options.content + '</div>') + (buttonContent) + '</div>';
      options.content = content;

      // 自动隐藏选项
      if (options.autoClose) {
        var _callbackCopy = options.callback || $.noop;
        options.callback = function() {
          _callbackCopy();
          // 自动隐藏
          clearTimeout(window.timerDialogHide);
          window.timerDialogHide = setTimeout(function() {
            $(closeClass).trigger('click');
          }, options.timeout);
        };
      }

      Dialog.show(options);
    }
  });
    //刷新当前页
  function refresh() {
      window.location.reload();
  }
  // 相关事件绑定
  (function() {
    var $doc = $(document);

    // 绑定：用于关闭对话弹窗
    $doc.on('click', closeClass, function() {
      var $that = $(this), beforeReturn;

      // 如果返回false，则表示中断关闭弹窗
      typeof dialogOpts.onBeforeClose === 'function' && (beforeReturn = dialogOpts.onBeforeClose($that));
      if (beforeReturn === false) return;

      clearTimeout(window.timerDialogHide);
      Dialog.hide(function() {
        if (typeof dialogOpts.onClose === 'function') {
          dialogOpts.onClose($that, beforeReturn);
        }
      });
    });





    // 绑定：用于执行弹窗的确认操作
    $doc.on('click', '.j_dialogConfirm', function () {

            var studentid = $.trim($("#studentid").val());
            var depict = $.trim($("#depict").val());
            if (studentid == '' || depict == '') {
                $.sendError('发送失败，学号和内容不能为空！', 2000, function () {
                    console.log('sendError closed');
                });
                return;
            }
            $.ajax({
                type: "post",
                url: "main.aspx/insertfeedback",
                data: "{studentid:'" + studentid + "',depict:'" + depict + "'}",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d == "0") {
                        $.sendSuccess('发送成功', 2000, function () {
                            console.log('sendSuccess closed');
                        });

                    }
                    else if (data.d == "1") {
                        $.sendError('发送失败，请重试！', 2000, function () {
                            console.log('sendError closed');
                        });
                    }
                    else if (data.d == "2") {

                        $.sendError('发送失败，学号不存在！', 2000, function () {
                            console.log('sendError closed');
                        });
                    }
                    else if (data.d == "3") {
                        $.sendError('发送失败，内容不能为空！', 2000, function () {
                            console.log('sendError closed');
                        });
                    }
                },
                error: function (e) {
                    alert("错误是:" + e.responseText);
                }
            });
        
        
        var $that = $(this), beforeReturn;

      // 如果提交按钮存在noconfirm属性，将不执行响应
      if ($that.attr('noconfirm') !== undefined) return;

      // 如果返回false，则表示中断关闭弹窗
      typeof dialogOpts.onBeforeConfirm === 'function' && (beforeReturn = dialogOpts.onBeforeConfirm($that));
      if (beforeReturn === false) return;

      clearTimeout(window.timerDialogHide);
      Dialog.hide(function() {
        if (typeof dialogOpts.onConfirm === 'function') {
          dialogOpts.onConfirm($that, beforeReturn);
        }
      });
    });
      //修改信息
    $doc.on('click', '.j_dialogConfirm_c_m', function () {
        var phonenum = $.trim($("#c_phonrnum").val());
        var email = $.trim($("#c_email").val());
        var locations = $.trim($("#c_location").val());
        if (phonenum == '' || email == '' || locations == '') {
            $.sendError('内容不能为空！', 2000, function () {
                console.log('sendError closed');
            });
            return;
        }
        $.ajax({
            type: "post",
            url: "Personal.aspx/ChangeAccountMessage",
            data: "{email:'" + email + "',phonenum:'" + phonenum + "',location:'" + locations + "'}",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.d == "1") {
                    $.sendSuccess('修改成功', 2000, function () {
                        refresh();
                        console.log('sendSuccess closed');
                    });
                    
                }
                else{
                    $.sendError('修改失败，请重试！', 2000, function () {
                        console.log('sendError closed');
                    });
                }

            },
            error: function (e) {
                alert("错误是:" + e.responseText);
            }
        });
        
        var $that = $(this), beforeReturn;

        // 如果提交按钮存在noconfirm属性，将不执行响应
        if ($that.attr('noconfirm') !== undefined) return;

        // 如果返回false，则表示中断关闭弹窗
        typeof dialogOpts.onBeforeConfirm === 'function' && (beforeReturn = dialogOpts.onBeforeConfirm($that));
        if (beforeReturn === false) return;

        clearTimeout(window.timerDialogHide);
        Dialog.hide(function () {
            if (typeof dialogOpts.onConfirm === 'function') {
                dialogOpts.onConfirm($that, beforeReturn);
            }
        });
    });
      //修改密码
    $doc.on('click', '.j_dialogConfirm_c_p', function () {
        var email = $.trim($("#c_p_email").val());
        var newpassword = $.trim($("#c_newpassword").val());
        var yzm = $.trim($("#c_yzm").val());
        if (email == '' || newpassword == '') {
            $.sendError('电子邮箱、密码、验证码不能为空！', 2000, function () {
                console.log('sendError closed');
            });
            return;
        }
        $.ajax({
            type: "post",
            url: "Personal.aspx/ChangePassword",
            data: "{yzm:'" + yzm + "',newpassword:'" + newpassword + "',email:'" + email + "'}",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.d == "1") {
                    $.sendSuccess('修改成功', 2000, function () {
                        console.log('sendSuccess closed');
                    });
                    
                }
                else if(data.d == "2")
                {
                    alert("验证码失效；请重新获取");
                }
                else if (data.d == "3") {
                    alert("验证码错误；请重新输入");
                }
                else {
                    $.sendError('修改失败，请重试！', 2000, function () {
                        console.log('sendError closed');
                    });
                }

            },
            error: function (e) {
                alert("错误是:" + e.responseText);
            }
        });

        var $that = $(this), beforeReturn;

        // 如果提交按钮存在noconfirm属性，将不执行响应
        if ($that.attr('noconfirm') !== undefined) return;

        // 如果返回false，则表示中断关闭弹窗
        typeof dialogOpts.onBeforeConfirm === 'function' && (beforeReturn = dialogOpts.onBeforeConfirm($that));
        if (beforeReturn === false) return;

        clearTimeout(window.timerDialogHide);
        Dialog.hide(function () {
            if (typeof dialogOpts.onConfirm === 'function') {
                dialogOpts.onConfirm($that, beforeReturn);
            }
        });
    });


    // 绑定：用于执行弹窗的取消操作
    $doc.on('click', '.j_dialogCancel', function() {
      var $that = $(this), beforeReturn;

      // 如果返回false，则表示中断关闭弹窗
      typeof dialogOpts.onBeforeCancel === 'function' && (beforeReturn = dialogOpts.onBeforeCancel($that));
      if (beforeReturn === false) return;

      clearTimeout(window.timerDialogHide);
      Dialog.hide(function() {
        if (typeof dialogOpts.onCancel === 'function') {
          dialogOpts.onCancel($that, beforeReturn);
        }
      });
    });

    // 绑定：点击弹窗遮罩层关闭弹窗
    $doc.on('click', '.j_bgHide', function() {
      $(closeClass).trigger('click');
    });

    // 绑定：按ESC按键关闭弹窗
    $doc.on('keyup', function(ev) {
      if (ev.keyCode == 27 && $('.j_escHide').length) {
        $(closeClass).trigger('click').removeClass('j_dialogClose');
      }
    });
  })();

  // 使用$.dialog()进行访问
  $.dialog = Dialog.show;
  $.dialogClose = Dialog.hide;
   

});
//发送验证码
function c_yzm() {
       
    var email = $.trim($("#c_p_email").val());
        //发送验证码
        $.ajax({
            type: "post",
            url: "Forget_password.aspx/QQ_email",
            data: "{'Email':'" + email + "'}",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.d == "1") {
                    //验证码时间
                    var code = $("#c_newpassword_yzm");
                    code.attr("disabled", "disabled");
                    setTimeout(function () {
                        code.css("opacity", "0.8");
                        code.css("cursor", "no-drop")
                    }, 1000)
                    var time = 60;
                    var set = setInterval(function () {
                        code.val("(" + --time + ")秒后重新获取");
                    }, 1000);
                    setTimeout(function () {
                        code.attr("disabled", false).val("重新获取验证码");
                        code.css("cursor", "pointer")
                        clearInterval(set);
                    }, 60000);
                    
                    //alert("发送成功，请注意查收");
                }
                else {
                    alert("发送失败，请重试！");
                    
                }
            },
            error: function (e) {
                alert("错误是:" + e.responseText);
            }
        });
}

