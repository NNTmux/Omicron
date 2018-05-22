<!DOCTYPE html>
<html>
{if isset($error) && $error != ''}
	<div class="alert alert-danger">{$error}</div>
{/if}
{if isset($notice) && $notice != ''}
	<div class="alert alert-info">{$notice}</div>
{/if}
{if isset($sent) && $sent != ''}
	<div class="alert alert-info">A link to reset your password has been sent to your e-mail account.</div>
{/if}
<head>
	<meta charset="UTF-8">
	<title>{$meta_title}{if $meta_title != "" && $site->metatitle != ""} - {/if}{$site->metatitle} | Registration
		Page</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
</head>
{if $showregister != "0"}
	<body class="register-page">
	<div class="register-box">
		<div class="register-logo">
			<a href="{$serverroot}"><b>{$site->title}</b></a>
		</div>
		<div class="register-box-body">
			<p class="login-box-msg">Register a new membership</p>
			<form method="post" action="register?action=submit{$invite_code_query}">
				{{csrf_field()}}
				<div class="form-group has-feedback">
					<input autocomplete="off" id="username" name="username" value="{$username}" type="text"
						   class="form-control" placeholder="Username"/>
					<span class="glyphicon glyphicon-user form-control-feedback"></span>
					<div class="hint">Should be at least three characters and start with a letter.</div>
				</div>
				<div class="form-group has-feedback">
					<input autocomplete="off" id="email" name="email" value="{$email}" type="email" class="form-control"
						   placeholder="Email"/>
					<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input id="password" autocomplete="off" name="password" value="{$password}" type="password"
						   class="form-control" placeholder="Password"/>
					<span class="glyphicon glyphicon-lock form-control-feedback"></span>
					<div class="hint">Should be at least six characters long.</div>
				</div>
				<div class="form-group has-feedback">
					<input autocomplete="off" id="password_confirmation" name="password_confirmation"
						   value="{$confirmpassword}" type="password" class="form-control"
						   placeholder="Retype password"/>
					<span class="glyphicon glyphicon-log-in form-control-feedback"></span>
				</div>
				<div class="row">
					<div class="col-xs-8">
						<div class="checkbox icheck">
							<label>
								<input type="checkbox"> I agree to the <a
										href="{$serverroot}terms-and-conditions">terms</a>
							</label>
						</div>
					</div><!-- /.col -->
					<div class="col-xs-4">
						<button type="submit" value="Register" class="btn btn-primary btn-block btn-flat">Register
						</button>
					</div><!-- /.col -->
					<hr>
					<div style="text-align: center;">
						{if {env('NOCAPTCHA_ENABLED')} == 1 && !empty({env('NOCAPTCHA_SITEKEY')}) && !empty({env('NOCAPTCHA_SECRET')})}
							{NoCaptcha::display()}{NoCaptcha::renderJs()}
						{/if}
					</div>
				</div>
				<a href="{$serverroot}login" class="text-center">I already have a membership</a>
			</form>
		</div><!-- /.form-box -->
	</div><!-- /.register-box -->
	<script>
        $(function () {
            $('input').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' // optional
            });
        });
	</script>
	</body>
{/if}
</html>
