$(document).on('turbolinks:load', function() {
    $('#maingazou').change(function(){
        if (!this.files.length) {
            return;
        }
        var file = this.files[0],           //画像１つのみ選択
            image = $(this).parent(),
            fileReader = new FileReader();
        // 読み込みが完了した際のイベントハンドラ。imgのsrcにデータセット
        fileReader.onload = function(event) {
            // 読み込んだデータをimgに設定
            image.children('img').attr('src', event.target.result);
            // imgLiquid - imgの親要素に指定
            image.imgLiquid();
        };
        // 画像読み込み
        fileReader.readAsDataURL(file);
    });
});

$(document).on('turbolinks:load', function() {
    $('.subgazou').change(function(){
        if (!this.files.length) {
            return;
        }
        var file = this.files[0],           //画像１つのみ選択
            image = $(this).parent(),
            fileReader = new FileReader();
        // 読み込みが完了した際のイベントハンドラ。imgのsrcにデータセット
        fileReader.onload = function(event) {
            // 読み込んだデータをimgに設定
            image.children('img').attr('src', event.target.result);
            // imgLiquid - imgの親要素に指定
            image.imgLiquid();
        };
        // 画像読み込み
        fileReader.readAsDataURL(file);
    });
});


// $(function(){
// $('#main_image_uploader').on('change', 'input[type="file"]', function(e) {
//     var file = e.target.files[0],
//         reader = new FileReader(),
//         $preview = $(this).parent();
//         t = this;

//     // 画像ファイル以外の場合は何もしない
//     if(file.type.indexOf("image") < 0){
//       return false;
//     }

//     // ファイル読み込みが完了した際のイベント登録
//     reader.onload = (function(file) {
//       return function(e) {
//         //既存のプレビューを削除
//         $preview.empty();
//         // .prevewの領域の中にロードした画像を表示するimageタグを追加
//         $preview.append($('<img>').attr({
//                   src: e.target.result,
//                   width: "180px",
//                   class: "preview",
//                   title: file.name
//               }));
//         $preview.imgLiquid();
//       };
//     })(file);

//     reader.readAsDataURL(file);
//   });
// });


// $(function(){
// $('.image-upload').on('change', 'input[type="file"]', function(e) {
//     var file = e.target.files[0],
//         reader = new FileReader(),
//         $preview = $(this).parent();
//         t = this;

//     // 画像ファイル以外の場合は何もしない
//     if(file.type.indexOf("image") < 0){
//       return false;
//     }

//     // ファイル読み込みが完了した際のイベント登録
//     reader.onload = (function(file) {
//       return function(e) {
//         //既存のプレビューを削除
//         $preview.empty();
//         // .prevewの領域の中にロードした画像を表示するimageタグを追加
//         $preview.append($('<img>').attr({
//                   src: e.target.result,
//                   width: "180px",
//                   class: "preview",
//                   title: file.name
//               }));
//         $preview.imgLiquid();
//       };
//     })(file);

//     reader.readAsDataURL(file);
//   });
// });




// // var file = document.querySelector('#aaaaa');

// // file.onchange = function (){
// //   var fileList = file.files;
// //   //読み込み
// //   var reader = new FileReader();
// //   reader.readAsDataURL(fileList[0]);

// //   //読み込み後
// //   reader.onload = function  () {
// //     document.querySelector('.preview').src = reader.result;
// //   };
// // };
// });


// $(function() {
//     // jQuery Upload Thumbs
//     $('#maingazou').uploadThumbs({
//         position : '#main_image_uploader',
//            // any: arbitrarily jquery selector
//     });
//         $('#maingazou').imgLiquid();


//     $('#upload2').uploadThumbs({
//         position : '#preview2',   // any: arbitrarily jquery selector
//     });
// });



