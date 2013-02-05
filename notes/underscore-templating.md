# Templating with Underscore.js

[Underscore.js](http://underscorejs.com) is a JavaScript library to reduce pains in (my) ass when I have to manipulate DOM content.

## Goal

I want to create a list of something from JSON returned from the server. Let's say it is an array of `user` objects.

```json
[
	{
    	"id" : 1,
        "name" : "armno",
        "fb_id" : "100000323120002",
        "email" : "arm@armno.in.th"
	},
	{
    	"id" : 2,
        "name" : "george",
        "fb_id" : "10000314890544",
        "email" : "george@gmail.com"
    },
    {
    	"id" : 3,
        "name" : "peach",
        "fb_id" : "770098097",
        "email" : "peach@live.com"
    }
]
```

and HTML template

```html
<ul id="users-list">
	<li>
    	<a href="/users/<id>">
        	<img src="<facebook_profile_image>" alt="<name>">
        </a>
    </li>
</ul>
```

### What I usually do

```javascript
var $ul = $('<ul>'),
	$li = $('<li>'),
    $a = $('<a>'),
    $l, $img, a;
    
$.each(users, function(user, index) {
	$img = $('<img>', {
    	src : "//graph.facebook.com/" + user.fb_id + "/picture",
        alt : user.name + " profile picture"
    });
    
    a = $a.clone().attr('href', '/users/' + user.id);
    
    $('#users-list').append($li.clone().append(a.append($img)));
});

// or create a documentFragment to hold generated <li> elements and append to $('#users-list')
// outside of $.each loop
```

## Let's get started with `underscore.js`

- load `jquery` and `underscore.js` into the page

```html
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script src="http://underscorejs.org/underscore-min.js"></script>
```

- create a template block

```html
<script type="text/template" id="user-template">
	<% _.each(users, function(user, index) { %>
    <li>
    	<a href="/users/<%= user.id %>">
        	<img src="//graph.facebook.com/<%= user.fb_id %>/picture" alt="<%= user.name %> profile picture">
        </a>
    </li>
   	<% } %> 
</script>
```

- render the template by passing an object to `_.template` function

```html
<script>
$(function(){
	var users = [
		{
    		"id" : 1,
	        "name" : "armno",
	        "fb_id" : "100000323120002",
	        "email" : "arm@armno.in.th"
		},
		{
	    	"id" : 2,
	        "name" : "george",
    	    "fb_id" : "10000314890544",
    	    "email" : "george@gmail.com"
	    },
	    {
    		"id" : 3,
        	"name" : "peach",
	        "fb_id" : "770098097",
    	    "email" : "peach@live.com"
	    }
	];
    
	var template = $('#user-template').html(),
    	renderedHtml = _.template(template, {
        	users : users
        });
        
   $('#users-list').html(renderedHtml);
});
</script>
```

fin.

