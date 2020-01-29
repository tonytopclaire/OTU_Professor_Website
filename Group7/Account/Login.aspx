<%@ Page Title="Log in" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Login.aspx.vb" Inherits="Account_Login" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
	<div class="container img-rounded gap-ub">
		<div class="row">
			<div class="col-lg-4"></div>
			<div class="col-lg-4">
				<h1>Login Platform</h1>
				<br/>
				<section id="loginForm">
					<asp:Login runat="server" ViewStateMode="Disabled" RenderOuterTable="false">
						<LayoutTemplate>
							<p class="validation-summary-errors">
								<asp:Literal runat="server" ID="FailureText" />
							</p>
							<fieldset>
								<div class="form-group">
									<asp:Label runat="server" AssociatedControlID="UserName">User Name</asp:Label>
									<asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
									<asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
										CssClass="error" ErrorMessage="* The user name field is required. *" /><br/>
									<asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label>
									<asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
									<asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
										CssClass="error" ErrorMessage="* The password field is required. *" /><br/>
									<asp:CheckBox runat="server" ID="RememberMe" />
									<asp:Label runat="server" AssociatedControlID="RememberMe" CssClass="checkbox">Remember me?</asp:Label>
								</div>
								<asp:Button runat="server" CommandName="Login" Text="Log in" CssClass="btn btn-primary form-control" />
							</fieldset>
						</LayoutTemplate>
					</asp:Login>
					<p>
						<asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Register</asp:HyperLink>
						if you don't have an account.
					</p>
				</section>
				<section id="socialLoginForm" hidden="hidden">
					<h2>Use another service to log in.</h2>
					<uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
				</section>
			</div>
			<div class="col-lg-4"></div>
		</div>
	</div>
</asp:Content>
