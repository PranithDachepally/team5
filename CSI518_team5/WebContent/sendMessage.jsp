<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Sending Message</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
        
        <link rel="stylesheet" href="form.css" >
        <script src="js/validate.js"></script>
    </head>
    <body >
    
        <div class="container">
            <div class="container form-top">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
                        <div class="panel panel-danger">
                            <div class="panel-body">
                                <form id="reused_form" class="form-email"  action="/CSI518_team5/main" method="post" class="login100-form validate-form">
                                    <div class="form-group">
                                        <label >From</label>
                                        <input type="text" name="from" required class="form-control" placeholder="Enter Name">
                                    </div>
                                    <div class="form-group">
                                        <label >To</label>
                                        <input type="email" name="to" required class="form-control" placeholder="Enter Email">
                                    </div>
                                    <div class="form-group">
                                        <label >Message</label>
                                        <textarea rows="3" name="content" class="form-control" placeholder="Type Your Message"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <button class="btn btn-raised btn-lg btn-warning" type="submit">Send</button>
                                       <a href="index.jsp">Back</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
