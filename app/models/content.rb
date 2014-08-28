class Content < ActiveRecord::Base
 validates :path, format: { with: /\A.*\.((jpg)|(JPG)|(png)|(PNG)|(gif)|(GIF)|(bmp)|(BMP)|(odt)|(ODT)|(jpeg)|(JPEG)|(doc)|(DOC)|(docx)|(DOCX)|(pdf)|(PDF))\z/,
 message: "only allows jpg, png, gif, jpeg, odt,doc, docx, pdf formats" }, uniqueness: true
end
