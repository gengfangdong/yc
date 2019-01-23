/**
 * @license Copyright (c) 2003-2018, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
// Define changes to default configuration here. For example:
   // config.language = 'fr';
    /**配置语言*/
    config.language = 'zh-cn';
    /**配置界面颜色*/
    //config.uiColor = '#AADC6E';
    /**配置字体*/
    config.font_names='宋体/SimSun;新宋体/NSimSun;仿宋_GB2312/FangSong_GB2312;楷体_GB2312/KaiTi_GB2312;黑体/SimHei;微软雅黑/Microsoft YaHei;'+ config.font_names;
    /**配置工具栏*/
    config.image_previewText=' '; //预览区域显示内容
    config.filebrowserImageUploadUrl= 'http://localhost:8081/Common/uploadFile ';
    config.filebrowserUploadUrl='http://localhost:8081/Common/uploadFileceditor';
    /*
    config.toolbar = 'Basic';
    config.toolbar_Basic =
        [
            ['Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink','-','About']
        ];
    */
};
