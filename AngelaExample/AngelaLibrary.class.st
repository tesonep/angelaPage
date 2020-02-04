Class {
	#name : #AngelaLibrary,
	#superclass : #WAFileMetadataLibrary,
	#category : #AngelaExample
}

{ #category : #accessing }
AngelaLibrary >> baseCss [

	^ WAFileLibraryResource
		filepath: 'base.css'
		mimeType: (WAMimeType main: 'text' sub: 'css')
		cacheDuration: (Duration days: 0 hours: 0 minutes: 30 seconds: 0)
		contents: (GRDelayedSend receiver: self selector: #baseCssContent)
]

{ #category : #accessing }
AngelaLibrary >> baseCssContent [

	^ 

'html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed,
figure, figcaption, footer, header, hgroup,
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
}

article, aside, details, figcaption, figure,
footer, header, hgroup, menu, nav, section {
  display: block;
}
body {
  line-height: 1;
}
ol, ul {
  list-style: none;
}
blockquote, q {
  quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
  content: '';
  content: none;
}
table {
  border-collapse: collapse;
  border-spacing: 0;
}

img, iframe {
  vertical-align: bottom;
  max-width: 100%;
}

input, textarea, select {
  font: inherit;
}

* {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-font-smoothing: antialiased;
  text-rendering: optimizeLegibility;
}'
]

{ #category : #accessing }
AngelaLibrary >> fontCssContent [

	^  '@import url(//fonts.googleapis.com/css?family=Work+Sans:400);'
]

{ #category : #accessing }
AngelaLibrary >> fontsCss [

	^ WAFileLibraryResource
		filepath: 'font.css'
		mimeType: (WAMimeType main: 'text' sub: 'css')
		cacheDuration: (Duration days: 0 hours: 0 minutes: 30 seconds: 0)
		contents: (GRDelayedSend receiver: self selector: #fontCssContent)
]

{ #category : #'uploaded metadata' }
AngelaLibrary >> iconfacebookSvg [
	^ WAFileLibraryResource
		filepath: 'icon-facebook.svg'
		mimeType: (WAMimeType main: 'image' sub: 'svg+xml')
		cacheDuration: (Duration days: 0 hours: 0 minutes: 30 seconds: 0)
		contents: (GRDelayedSend receiver: self selector: #iconfacebookSvgContent)
]

{ #category : #uploaded }
AngelaLibrary >> iconfacebookSvgContent [
	^ #[60 63 120 109 108 32 118 101 114 115 105 111 110 61 34 49 46 48 34 32 101 110 99 111 100 105 110 103 61 34 117 116 102 45 56 34 63 62 10 60 33 45 45 32 71 101 110 101 114 97 116 111 114 58 32 65 100 111 98 101 32 73 108 108 117 115 116 114 97 116 111 114 32 49 57 46 49 46 48 44 32 83 86 71 32 69 120 112 111 114 116 32 80 108 117 103 45 73 110 32 46 32 83 86 71 32 86 101 114 115 105 111 110 58 32 54 46 48 48 32 66 117 105 108 100 32 48 41 32 32 45 45 62 10 60 115 118 103 32 118 101 114 115 105 111 110 61 34 49 46 49 34 32 105 100 61 34 76 97 121 101 114 95 49 34 32 120 109 108 110 115 61 34 104 116 116 112 58 47 47 119 119 119 46 119 51 46 111 114 103 47 50 48 48 48 47 115 118 103 34 32 120 109 108 110 115 58 120 108 105 110 107 61 34 104 116 116 112 58 47 47 119 119 119 46 119 51 46 111 114 103 47 49 57 57 57 47 120 108 105 110 107 34 32 120 61 34 48 112 120 34 32 121 61 34 48 112 120 34 10 9 32 118 105 101 119 66 111 120 61 34 48 32 48 32 54 52 32 54 52 34 32 101 110 97 98 108 101 45 98 97 99 107 103 114 111 117 110 100 61 34 110 101 119 32 48 32 48 32 54 52 32 54 52 34 32 120 109 108 58 115 112 97 99 101 61 34 112 114 101 115 101 114 118 101 34 62 10 60 112 97 116 104 32 102 105 108 108 61 34 35 69 69 69 69 69 69 34 32 100 61 34 77 48 44 48 118 54 52 104 54 52 86 48 72 48 122 32 77 53 54 44 49 55 99 48 44 48 45 53 46 53 49 51 44 48 45 55 46 53 44 48 99 45 49 46 50 52 51 44 48 45 50 46 53 44 49 46 48 48 55 45 50 46 53 44 50 46 50 53 99 48 44 48 46 54 55 53 44 48 46 48 49 49 44 54 46 55 53 44 48 46 48 49 49 44 54 46 55 53 72 53 54 118 56 10 9 104 45 57 46 57 57 49 76 52 54 44 53 53 72 51 54 108 48 46 48 48 56 45 50 49 72 51 48 118 45 56 104 54 46 48 49 49 99 48 44 48 45 48 46 48 49 49 45 56 46 55 57 57 45 48 46 48 49 49 45 57 99 48 45 52 44 52 45 56 44 56 45 56 99 53 44 48 44 49 50 44 48 44 49 50 44 48 86 49 55 122 34 47 62 10 60 47 115 118 103 62 10]
]

{ #category : #'uploaded metadata' }
AngelaLibrary >> iconinstagramSvg [
	^ WAFileLibraryResource
		filepath: 'icon-instagram.svg'
		mimeType: (WAMimeType main: 'image' sub: 'svg+xml')
		cacheDuration: (Duration days: 0 hours: 0 minutes: 30 seconds: 0)
		contents: (GRDelayedSend receiver: self selector: #iconinstagramSvgContent)
]

{ #category : #uploaded }
AngelaLibrary >> iconinstagramSvgContent [
	^ #[60 63 120 109 108 32 118 101 114 115 105 111 110 61 34 49 46 48 34 32 101 110 99 111 100 105 110 103 61 34 117 116 102 45 56 34 63 62 10 60 33 45 45 32 71 101 110 101 114 97 116 111 114 58 32 65 100 111 98 101 32 73 108 108 117 115 116 114 97 116 111 114 32 49 57 46 49 46 48 44 32 83 86 71 32 69 120 112 111 114 116 32 80 108 117 103 45 73 110 32 46 32 83 86 71 32 86 101 114 115 105 111 110 58 32 54 46 48 48 32 66 117 105 108 100 32 48 41 32 32 45 45 62 10 60 115 118 103 32 118 101 114 115 105 111 110 61 34 49 46 49 34 32 105 100 61 34 76 97 121 101 114 95 49 34 32 120 109 108 110 115 61 34 104 116 116 112 58 47 47 119 119 119 46 119 51 46 111 114 103 47 50 48 48 48 47 115 118 103 34 32 120 109 108 110 115 58 120 108 105 110 107 61 34 104 116 116 112 58 47 47 119 119 119 46 119 51 46 111 114 103 47 49 57 57 57 47 120 108 105 110 107 34 32 120 61 34 48 112 120 34 32 121 61 34 48 112 120 34 10 9 32 118 105 101 119 66 111 120 61 34 48 32 48 32 54 52 32 54 52 34 32 101 110 97 98 108 101 45 98 97 99 107 103 114 111 117 110 100 61 34 110 101 119 32 48 32 48 32 54 52 32 54 52 34 32 120 109 108 58 115 112 97 99 101 61 34 112 114 101 115 101 114 118 101 34 62 10 60 103 62 10 9 60 112 97 116 104 32 102 105 108 108 61 34 35 69 69 69 69 69 69 34 32 100 61 34 77 52 56 44 48 72 49 54 67 55 46 50 44 48 44 48 44 55 46 50 44 48 44 49 54 118 51 50 99 48 44 56 46 56 44 55 46 50 44 49 54 44 49 54 44 49 54 104 51 50 99 56 46 56 44 48 44 49 54 45 55 46 50 44 49 54 45 49 54 86 49 54 67 54 52 44 55 46 50 44 53 54 46 56 44 48 44 52 56 44 48 122 32 77 51 50 44 52 56 10 9 9 99 45 56 46 56 51 55 44 48 45 49 54 45 55 46 49 54 51 45 49 54 45 49 54 115 55 46 49 54 51 45 49 54 44 49 54 45 49 54 115 49 54 44 55 46 49 54 51 44 49 54 44 49 54 83 52 48 46 56 51 55 44 52 56 44 51 50 44 52 56 122 34 47 62 10 9 60 99 105 114 99 108 101 32 102 105 108 108 61 34 35 69 69 69 69 69 69 34 32 99 120 61 34 51 50 34 32 99 121 61 34 51 50 34 32 114 61 34 56 34 47 62 10 60 47 103 62 10 60 47 115 118 103 62 10]
]

{ #category : #'uploaded metadata' }
AngelaLibrary >> icontwitterSvg [
	^ WAFileLibraryResource
		filepath: 'icon-twitter.svg'
		mimeType: (WAMimeType main: 'image' sub: 'svg+xml')
		cacheDuration: (Duration days: 0 hours: 0 minutes: 30 seconds: 0)
		contents: (GRDelayedSend receiver: self selector: #icontwitterSvgContent)
]

{ #category : #uploaded }
AngelaLibrary >> icontwitterSvgContent [
	^ #[60 63 120 109 108 32 118 101 114 115 105 111 110 61 34 49 46 48 34 32 101 110 99 111 100 105 110 103 61 34 117 116 102 45 56 34 63 62 10 60 33 45 45 32 71 101 110 101 114 97 116 111 114 58 32 65 100 111 98 101 32 73 108 108 117 115 116 114 97 116 111 114 32 49 57 46 49 46 48 44 32 83 86 71 32 69 120 112 111 114 116 32 80 108 117 103 45 73 110 32 46 32 83 86 71 32 86 101 114 115 105 111 110 58 32 54 46 48 48 32 66 117 105 108 100 32 48 41 32 32 45 45 62 10 60 115 118 103 32 118 101 114 115 105 111 110 61 34 49 46 49 34 32 105 100 61 34 76 97 121 101 114 95 49 34 32 120 109 108 110 115 61 34 104 116 116 112 58 47 47 119 119 119 46 119 51 46 111 114 103 47 50 48 48 48 47 115 118 103 34 32 120 109 108 110 115 58 120 108 105 110 107 61 34 104 116 116 112 58 47 47 119 119 119 46 119 51 46 111 114 103 47 49 57 57 57 47 120 108 105 110 107 34 32 120 61 34 48 112 120 34 32 121 61 34 48 112 120 34 10 9 32 118 105 101 119 66 111 120 61 34 48 32 48 32 54 52 32 54 52 34 32 101 110 97 98 108 101 45 98 97 99 107 103 114 111 117 110 100 61 34 110 101 119 32 48 32 48 32 54 52 32 54 52 34 32 120 109 108 58 115 112 97 99 101 61 34 112 114 101 115 101 114 118 101 34 62 10 60 112 97 116 104 32 102 105 108 108 61 34 35 69 69 69 69 69 69 34 32 100 61 34 77 54 52 44 53 46 57 56 52 104 45 57 46 53 49 49 67 53 49 46 53 53 55 44 50 46 51 53 57 44 52 55 46 48 53 50 45 48 46 48 48 56 44 52 50 45 48 46 48 48 56 99 45 56 46 50 48 55 44 48 45 49 52 46 57 55 44 54 46 49 56 52 45 49 53 46 56 57 50 44 49 52 46 49 52 52 10 9 99 45 56 46 57 48 52 45 49 46 48 57 45 49 55 46 48 53 54 45 52 46 54 49 52 45 50 51 46 55 54 52 45 57 46 56 57 51 67 48 46 52 55 52 44 55 46 50 55 52 44 48 44 49 50 46 50 55 56 44 48 44 49 53 46 57 57 57 99 48 44 49 52 46 50 49 54 44 54 46 49 56 44 50 55 46 50 49 49 44 49 54 44 51 54 99 45 51 44 53 45 55 46 53 44 55 46 53 45 49 54 44 57 10 9 99 53 44 50 44 49 48 46 53 49 50 44 51 44 49 54 44 51 99 51 50 44 48 44 52 56 45 50 52 46 48 57 56 44 52 50 45 52 57 46 53 48 56 76 54 52 44 53 46 57 56 52 122 34 47 62 10 60 47 115 118 103 62 10]
]

{ #category : #'uploaded metadata' }
AngelaLibrary >> logoSvg [
	^ WAFileLibraryResource
		filepath: 'logo.svg'
		mimeType: (WAMimeType main: 'image' sub: 'svg+xml')
		cacheDuration: (Duration days: 0 hours: 0 minutes: 30 seconds: 0)
		contents: (GRDelayedSend receiver: self selector: #logoSvgContent)
]

{ #category : #uploaded }
AngelaLibrary >> logoSvgContent [
	^ #[60 63 120 109 108 32 118 101 114 115 105 111 110 61 34 49 46 48 34 32 101 110 99 111 100 105 110 103 61 34 117 116 102 45 56 34 63 62 10 60 33 45 45 32 71 101 110 101 114 97 116 111 114 58 32 65 100 111 98 101 32 73 108 108 117 115 116 114 97 116 111 114 32 49 57 46 49 46 48 44 32 83 86 71 32 69 120 112 111 114 116 32 80 108 117 103 45 73 110 32 46 32 83 86 71 32 86 101 114 115 105 111 110 58 32 54 46 48 48 32 66 117 105 108 100 32 48 41 32 32 45 45 62 10 60 115 118 103 32 118 101 114 115 105 111 110 61 34 49 46 49 34 32 105 100 61 34 76 97 121 101 114 95 49 34 32 120 109 108 110 115 61 34 104 116 116 112 58 47 47 119 119 119 46 119 51 46 111 114 103 47 50 48 48 48 47 115 118 103 34 32 120 109 108 110 115 58 120 108 105 110 107 61 34 104 116 116 112 58 47 47 119 119 119 46 119 51 46 111 114 103 47 49 57 57 57 47 120 108 105 110 107 34 32 120 61 34 48 112 120 34 32 121 61 34 48 112 120 34 10 9 32 118 105 101 119 66 111 120 61 34 48 32 48 32 54 52 32 54 52 34 32 101 110 97 98 108 101 45 98 97 99 107 103 114 111 117 110 100 61 34 110 101 119 32 48 32 48 32 54 52 32 54 52 34 32 120 109 108 58 115 112 97 99 101 61 34 112 114 101 115 101 114 118 101 34 62 10 60 112 97 116 104 32 102 105 108 108 61 34 35 69 69 69 69 69 69 34 32 100 61 34 77 51 50 44 48 67 49 52 46 51 50 55 44 48 44 48 44 49 52 46 51 50 55 44 48 44 51 50 99 48 44 49 55 46 54 55 51 44 49 52 46 51 50 55 44 51 50 44 51 50 44 51 50 115 51 50 45 49 52 46 51 50 55 44 51 50 45 51 50 67 54 52 44 49 52 46 51 50 55 44 52 57 46 54 55 51 44 48 44 51 50 44 48 122 32 77 52 50 44 49 54 10 9 99 51 46 51 49 52 44 48 44 54 44 50 46 54 56 54 44 54 44 54 99 48 44 51 46 51 49 52 45 50 46 54 56 54 44 54 45 54 44 54 115 45 54 45 50 46 54 56 54 45 54 45 54 67 51 54 44 49 56 46 54 56 54 44 51 56 46 54 56 54 44 49 54 44 52 50 44 49 54 122 32 77 50 50 44 49 54 99 51 46 51 49 52 44 48 44 54 44 50 46 54 56 54 44 54 44 54 99 48 44 51 46 51 49 52 45 50 46 54 56 54 44 54 45 54 44 54 10 9 115 45 54 45 50 46 54 56 54 45 54 45 54 67 49 54 44 49 56 46 54 56 54 44 49 56 46 54 56 54 44 49 54 44 50 50 44 49 54 122 32 77 51 50 44 53 54 67 49 57 46 52 49 57 44 53 54 44 57 46 49 48 55 44 52 54 46 51 49 56 44 56 46 48 56 57 44 51 52 104 54 46 48 50 56 67 49 53 46 49 49 51 44 52 50 46 57 57 57 44 50 50 46 55 51 54 44 53 48 44 51 50 44 53 48 10 9 115 49 54 46 56 56 55 45 55 46 48 48 49 44 49 55 46 56 56 51 45 49 54 104 54 46 48 50 56 67 53 52 46 56 57 51 44 52 54 46 51 49 56 44 52 52 46 53 56 49 44 53 54 44 51 50 44 53 54 122 34 47 62 10 60 47 115 118 103 62 10]
]

{ #category : #accessing }
AngelaLibrary >> selectorsToInclude [

	^ #(baseCss fontsCss styleCss)
]

{ #category : #accessing }
AngelaLibrary >> styleCss [

	^ WAFileLibraryResource
		filepath: 'style.css'
		mimeType: (WAMimeType main: 'text' sub: 'css')
		cacheDuration: (Duration days: 0 hours: 0 minutes: 30 seconds: 0)
		contents: (GRDelayedSend receiver: self selector: #styleCssContent)
]

{ #category : #accessing }
AngelaLibrary >> styleCssContent [

	^ 
'body {
	font-family: Work Sans;
	font-size: 16px;
	line-height: 1.5;
  color: #fff;
	background-color: #000;
  margin-top: 104px;
}

a{
  color: #fff;
  text-decoration: none;
}

header{
  /*overflow: hidden;*/
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
  padding: 20px;
  position: fixed;
  top: 0;
  left: 0;
  z-index: 2;
}

header h1{
  /*float: left;*/
  width: 64px;
}

header nav{
/*  float: right;
  margin-top: 20px;*/}

header nav a{
  margin-left: 10px;
  transition: border 0.5s 1s ease-in;
  border-bottom: solid 2px rgba(0,0,0,0);
  padding-bottom: 3px;
  }

header nav a:hover{
  border-bottom: 2px solid #555;
  padding-bottom: 3px;
}

.selected{
  border-bottom: solid 2px #fff;
  padding-bottom: 3px;
}

.photos{
  max-width: 1080px;
  margin-left: auto;
  margin-right: auto;
  padding-left: 10px;
  padding-right: 10px;
  display: flex;
  flex-wrap: wrap;
  align-items: flex-end;
  
}
.photo{
  /*display: inline-block;*/
  width: 300px;
  margin: 10px;
 /* vertical-align:bottom;*/
  position: relative;
}

.overlay{
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color:rgba(0,0,0,0.7);
  opacity: 0;
  transition: opacity 0.5s;
  z-index: 2;
}

.photo:hover .overlay{
  opacity: 1;
}

.photo h2{
  font-size: 32px;
  position:absolute ;
  margin-top: -15px;
  margin-left: -15px;
  line-height: 1.2;  
}

.photo img{
  transition: filter 0.5s;
}

.photo:hover img{
  filter: grayscale(100%);
}

.small{
  width: 220px ;
}
  
.large{
  width: 400px;
}

footer{
  display: flex;
  justify-content: space-between;
  align-items: center;
  
  padding: 20px;
}



footer nav a{
  width: 16px;
  margin-left: 5px;
  display: inline-block;
}

.list{
  max-width:640px ;
  margin-left: auto;
  margin-right: auto;
  font-size: 48px;
  line-height: 1.2;
  margin-top: 120px ;
}

.list a:after{
  content: "/";
}

.list a img{
   opacity: 0;
   position: fixed;
   left: 50%;
   top: 50%;
   transform: translate(-50%, -50%);
   max-width: 80vw;
   /* this tells the browser to ignore defult interaction with mouse  */
   pointer-events: none;
  transition: opacity 0.3s;
}

.list a:last-child:after{
  content: "";
}

.list a:hover img{
  opacity: 1;
}
  
@media(max-width:480px){
  
  .photos{
justify-content: center
}'
]
