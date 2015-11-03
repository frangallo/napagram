Napagram.Views.PostForm= Backbone.CompositeView.extend({
  template: JST["media/post_form"],

  events: {
    "click .photo-upload" : "uploadPhoto",
    "click .filters" : "changePhoto",
    "click .create-post" "submitPost"
  },

  initialize: function(){
    this.baseURL = "https://res.cloudinary.com/frankyg/image/upload/";
    this.image ="";
    this.url = "";
    this.thumbURL = "";
  },

  render: function(){
    this.$el.html(this.template({}));
    return this;
  },

  uploadPhoto: function(event){
    event.preventDefault();
    var self = this;
    cloudinary.openUploadWidget(CLOUDINARY_OPTIONS, function(error, result){
      var data = result[0];
      var image = data.public_id + "." + data.format;
      self.image = image;
      this.thumbURL = self.baseURL + "c_scale,w_300/" + image;
      this.url = self.baseURL + "c_scale,w_600/" + image;

      $('.filters').append("<div class=\"original btn btn-default\">Original</button>");
      $('.filters').append("<button class=\"sepia btn btn-default\">Sepia</button>");
      $('.filters').append("<button class=\"oil_paint btn btn-default\">Oil Paint</button>");
      $('.filters').append("<button class=\"saturation btn btn-default\">Saturate</button>");
      $('.filters').append("<button class=\"grayscale btn btn-default\">Grayscale</button>");
      $('.post-img-preview img').attr('src', this.thumbURL);
    });
  },

  changePhoto: function(event){
    var style = event.target.className.split(" ")[0]
      if (style === "original"){
        this.thumbURL = self.baseURL + "c_scale,w_300/" + image;
        this.url = self.baseURL + "c_scale,w_600/" + image;
      } else {
        this.thumbURL = this.baseURL + "e_" + style + ",c_scale,w_300/" + this.image;
        this.url = this.baseURL + "e_" + style + ",c_scale,w_600/" + this.image;
      }

    $('.post-img-preview img').attr('src', this.thumbURL);
  },

  submitPost: function(event){
    event.preventDefault();
  }

});
