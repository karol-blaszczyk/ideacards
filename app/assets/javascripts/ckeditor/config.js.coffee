# http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.config.html#.toolbar_Full
CKEDITOR.editorConfig = (config) ->
  config.language = 'pl'
  config.height = '600'
  # config.uiColor = '#e7876c'
  config.skin = 'kama'
  config.contentsCss = 'assets/application.css';
  config.removePlugins = 'elementspath,save';
  config.toolbar_Pure = [
    # { name: 'document',    items: [ 'Save','NewPage','DocProps','Preview','Print','-','Templates', ] },
    { name: 'clipboard',   items: [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
    # { name: 'editing',     items: [ 'Find','Replace','-','SelectAll'] },
    { name: 'tools',       items: [ 'Maximize', 'ShowBlocks', "Source" ] }
    { name: 'basicstyles', items: [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
    { name: 'paragraph',   items: [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl' ] },
    # { name: 'links',       items: [ 'Link','Unlink'] },
    '/',
    { name: 'styles',      items: [ 'Styles','Format','Font','FontSize' ] },
    { name: 'colors',      items: [ 'TextColor','BGColor' ] },
    # { name: 'insert',      items: [ 'Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak' ] },
  ]
  config.toolbar = 'Pure'
  true