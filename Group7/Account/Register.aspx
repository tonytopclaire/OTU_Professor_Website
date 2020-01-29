<%@ Page Title="Register" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.vb" Inherits="Account_Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

	<div class="container img-rounded gap-ub">
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<h1>Registration Platform</h1>
				<br />
				<asp:CreateUserWizard runat="server" ID="RegisterUser" ViewStateMode="Disabled" OnCreatedUser="RegisterUser_CreatedUser">
					<LayoutTemplate>
						<asp:PlaceHolder runat="server" ID="wizardStepPlaceholder" />
						<asp:PlaceHolder runat="server" ID="navigationPlaceholder" />
					</LayoutTemplate>
					<WizardSteps>
						<asp:CreateUserWizardStep runat="server" ID="RegisterUserWizardStep">
							<ContentTemplate>
								<p class="message-info">
									Passwords are required to be a minimum of <%: Membership.MinRequiredPasswordLength %> characters in length.
								</p>
								<br />
								<p class="validation-summary-errors">
									<asp:Literal runat="server" ID="ErrorMessage" />
								</p>
								<fieldset>
									<div class="form-group">
										<asp:Label
											runat="server"
											AssociatedControlID="UserName">User name</asp:Label>
										<asp:TextBox runat="server"
											ID="UserName"
											CssClass="form-control" />
										<asp:RequiredFieldValidator
											runat="server"
											ControlToValidate="UserName"
											CssClass="error"
											ErrorMessage="* The user name field is required. *" /><br />
										<asp:Label
											runat="server"
											AssociatedControlID="Email">Email address</asp:Label>
										<asp:TextBox
											runat="server"
											ID="Email"
											CssClass="form-control" />
										<asp:RequiredFieldValidator
											runat="server"
											ControlToValidate="Email"
											CssClass="error"
											ErrorMessage="* The email address field is required. *" /><br />
										<asp:RegularExpressionValidator
											runat="server"
											ErrorMessage=" * Please Enter a Valid Email Address. *"
											ControlToValidate="Email"
											CssClass="error"
											ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
										</asp:RegularExpressionValidator><br />
										<asp:Label
											runat="server"
											AssociatedControlID="Password">Password</asp:Label>
										<asp:TextBox
											runat="server"
											ID="Password"
											TextMode="Password"
											CssClass="form-control" />
										<asp:RequiredFieldValidator
											runat="server"
											ControlToValidate="Password"
											CssClass="error"
											ErrorMessage="* The password field is required. *" /><br />
										<asp:Label
											runat="server"
											AssociatedControlID="ConfirmPassword">Confirm password</asp:Label>
										<asp:TextBox
											runat="server"
											ID="ConfirmPassword"
											TextMode="Password"
											CssClass="form-control" />
										<asp:RequiredFieldValidator
											runat="server" ControlToValidate="ConfirmPassword"
											CssClass="error"
											Display="Dynamic"
											ErrorMessage="* The confirm password field is required. *" /><br />
										<asp:CompareValidator
											runat="server"
											ControlToCompare="Password"
											ControlToValidate="ConfirmPassword"
											CssClass="error"
											Display="Dynamic"
											ErrorMessage="* The password and confirmation password do not match. *" /><br />
									</div>
									<asp:Button
										runat="server"
										CommandName="MoveNext"
										Text="Register"
										CssClass="btn btn-primary form-control" />
								</fieldset>
							</ContentTemplate>
							<CustomNavigationTemplate />
						</asp:CreateUserWizardStep>
					</WizardSteps>
				</asp:CreateUserWizard>
			</div>
			<div class="col-lg-2"></div>
		</div>
	</div>
</asp:Content>
