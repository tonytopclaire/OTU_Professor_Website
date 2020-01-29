<%@ Page Language="VB" Title="Contact-Admin" MasterPageFile="~/Site.Master" AutoEventWireup="false" Codefile="contact-admin.aspx.vb" Inherits="contact_admin" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
	<%-------------------------------------Data Source-------------------------------------------%>
	<asp:AccessDataSource
		ID="ADSContact"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT * FROM [Contact]"
		DeleteCommand="DELETE FROM [Contact] WHERE [ID] = ?"
		InsertCommand="INSERT INTO [Contact] ([ID], [firstName], [lastName], [phoneNumber], [email], [address], [insitution], [department]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
		UpdateCommand="UPDATE [Contact] SET [firstName] = ?, [lastName] = ?, [phoneNumber] = ?, [email] = ?, [address] = ?, [insitution] = ?, [department] = ? WHERE [ID] = ?">
		<DeleteParameters>
			<asp:Parameter Name="ID" Type="Int32" />
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="ID" Type="Int32" />
			<asp:Parameter Name="firstName" Type="String" />
			<asp:Parameter Name="lastName" Type="String" />
			<asp:Parameter Name="phoneNumber" Type="String" />
			<asp:Parameter Name="email" Type="String" />
			<asp:Parameter Name="address" Type="String" />
			<asp:Parameter Name="insitution" Type="String" />
			<asp:Parameter Name="department" Type="String" />
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="firstName" Type="String" />
			<asp:Parameter Name="lastName" Type="String" />
			<asp:Parameter Name="phoneNumber" Type="String" />
			<asp:Parameter Name="email" Type="String" />
			<asp:Parameter Name="address" Type="String" />
			<asp:Parameter Name="insitution" Type="String" />
			<asp:Parameter Name="department" Type="String" />
			<asp:Parameter Name="ID" Type="Int32" />
		</UpdateParameters>
	</asp:AccessDataSource>
	<%-------------------------------------Data Source-------------------------------------------%>
	<div class="container img-rounded gap-ub">
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<h1 class="text-center">Contact-Admin Page</h1>
				<br />
				<div class="form-group">
					<asp:FormView ID="FormView1"
						runat="server"
						DataKeyNames="ID"
						DataSourceID="ADSContact"
						CssClass="aspnet100">
						<EditItemTemplate>
							<label for="txtFirstName">First Name:</label><br />
							<asp:TextBox
								ID="txtFirstName"
								runat="server"
								Text='<%# Bind("firstName") %>'
								CssClass="form-control" />
							<asp:RequiredFieldValidator
								runat="server"
								ControlToValidate="txtFirstName"
								ErrorMessage=" * Your first Name is required. *"
								ValidationGroup="EditContactFormGroup"
								CssClass="error">
							</asp:RequiredFieldValidator>
							<asp:RegularExpressionValidator
								runat="server"
								ControlToValidate="txtFirstName"
								ErrorMessage=" * Your first Name must be 2-10 letters. *"
								ValidationExpression="[a-zA-Z]{2,10}"
								ValidationGroup="EditContactFormGroup"
								CssClass="error" />
							<br />
							<label for="txtLastName">Last Name:</label><br />
							<asp:TextBox
								ID="txtLastName"
								runat="server"
								Text='<%# Bind("lastName") %>'
								CssClass="form-control" />
							<asp:RequiredFieldValidator
								runat="server"
								ControlToValidate="txtLastName"
								ErrorMessage=" * Your last Name is required. *"
								CssClass="error">
							</asp:RequiredFieldValidator>
							<asp:RegularExpressionValidator runat="server"
								ControlToValidate="txtLastName"
								ErrorMessage=" * Your last Name must be 2-10 letters. *"
								ValidationExpression="[a-zA-Z]{2,10}"
								CssClass="error" />
							<br />
							<label for="txtPhoneNumber">Phone Number:</label><br />
							<asp:TextBox
								ID="txtPhoneNumber"
								runat="server"
								Text='<%# Bind("phoneNumber") %>'
								CssClass="form-control" />
							<asp:RequiredFieldValidator runat="server"
								ControlToValidate="txtPhoneNumber"
								ValidationGroup="EditContactFormGroup"
								ErrorMessage=" * Your phone Number is required. *"
								CssClass="error">
							</asp:RequiredFieldValidator>
							<br />
							<label for="txtEmail">Email:</label><br />
							<asp:TextBox
								ID="txtEmail"
								runat="server"
								Text='<%# Bind("email") %>'
								CssClass="form-control" />
							<asp:RequiredFieldValidator
								runat="server"
								ControlToValidate="txtEmail"
								ValidationGroup="EditContactFormGroup"
								ErrorMessage=" * Your email is required. *"
								CssClass="error">
							</asp:RequiredFieldValidator>
							<asp:RegularExpressionValidator
								runat="server"
								ErrorMessage=" * Please Enter a Valid Email Address. *"
								ValidationGroup="EditContactFormGroup"
								ControlToValidate="txtEmail"
								CssClass="error"
								ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
							</asp:RegularExpressionValidator>
							<br />
							<label for="txtAddress">Address:</label><br />
							<asp:TextBox
								ID="txtAddress"
								runat="server"
								Text='<%# Bind("address") %>'
								CssClass="form-control" 
								MaxLength="50"/>
							<asp:RequiredFieldValidator
								runat="server"
								ControlToValidate="txtAddress"
								ValidationGroup="EditContactFormGroup"
								ErrorMessage=" * Your address is required. *"
								CssClass="error">
							</asp:RequiredFieldValidator>
							<br />
							<label for="txtInsitution">Insitution:</label><br />
							<asp:TextBox
								ID="txtInsitution"
								runat="server"
								Text='<%# Bind("insitution") %>'
								CssClass="form-control" 
								MaxLength="50"/>
							<asp:RequiredFieldValidator
								runat="server"
								ControlToValidate="txtInsitution"
								ValidationGroup="EditContactFormGroup"
								ErrorMessage=" * Current employeer information is required. *"
								CssClass="error">
							</asp:RequiredFieldValidator>
							<br />
							<label for="txtDepartment">Department:</label><br />
							<asp:TextBox ID="txtDepartment"
								runat="server"
								Text='<%# Bind("department") %>'
								CssClass="form-control" 
								MaxLength="50"/>
							<asp:RequiredFieldValidator
								runat="server"
								ControlToValidate="txtDepartment"
								ErrorMessage=" * Department information is required. *"
								ValidationGroup="EditContactFormGroup"
								CssClass="error">
							</asp:RequiredFieldValidator>
							<br />
							<asp:LinkButton
								ID="UpdateButton"
								runat="server"
								CausesValidation="True"
								CommandName="Update"
								Text="Update"
								CssClass="btn btn-primary form-control" />&nbsp;
							<asp:LinkButton
								ID="UpdateCancelButton"
								runat="server"
								CausesValidation="False"
								CommandName="Cancel"
								Text="Cancel"
								CssClass="btn btn-primary form-control" />
						</EditItemTemplate>
						<ItemTemplate>
							<label for="">First Name:</label><br />
							<asp:TextBox
								ID="firstNameTextBox"
								runat="server"
								Text='<%# Bind("firstName") %>'
								CssClass="form-control"
								Enabled="false" />
							<br />
							<label for="">Last Name:</label><br />
							<asp:TextBox
								ID="lastNameTextBox"
								runat="server"
								Text='<%# Bind("lastName") %>'
								CssClass="form-control"
								Enabled="false" />
							<br />
							<label for="">Phone Number:</label><br />
							<asp:TextBox
								ID="phoneNumberTextBox"
								runat="server"
								Text='<%# Bind("phoneNumber") %>'
								CssClass="form-control"
								Enabled="false" />
							<br />
							<label for="">Email:</label><br />
							<asp:TextBox
								ID="emailTextBox"
								runat="server"
								Text='<%# Bind("email") %>'
								CssClass="form-control"
								Enabled="false" />
							<br />
							<label for="">Address:</label><br />
							<asp:TextBox
								ID="addressTextBox"
								runat="server"
								Text='<%# Bind("address") %>'
								CssClass="form-control"
								Enabled="false" />
							<br />
							<label for="">Insitution:</label><br />
							<asp:TextBox
								ID="insitutionTextBox"
								runat="server"
								Text='<%# Bind("insitution") %>'
								CssClass="form-control"
								Enabled="false" />
							<br />
							<label for="">Department:</label><br />
							<asp:TextBox
								ID="departmentTextBox"
								runat="server"
								Text='<%# Bind("department") %>'
								CssClass="form-control"
								Enabled="false" />
							<br />
							<asp:LinkButton
								ID="EditButton"
								runat="server"
								CausesValidation="False"
								CommandName="Edit"
								Text="Edit"
								CssClass="btn btn-primary form-control" />
						</ItemTemplate>
					</asp:FormView>
				</div>
			</div>
			<div class="col-lg-2"></div>
		</div>
	</div>
</asp:Content>
