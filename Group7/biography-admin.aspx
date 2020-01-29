<%@ Page Language="VB" Title="Biography-Admin" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeFile="biography-admin.aspx.vb" Inherits="biography_admin" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
	<%-------------------------------------Data Source-------------------------------------------%>
	<asp:AccessDataSource
		ID="ADSBio"
		runat="server" DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT * FROM [Biography]"
		DeleteCommand="DELETE FROM [Biography] WHERE [ID] = ?"
		UpdateCommand="UPDATE [Biography] SET [introduction] = ? WHERE [ID] = ?">
		<DeleteParameters>
			<asp:Parameter Name="ID" Type="Int32" />
		</DeleteParameters>
		<UpdateParameters>
			<asp:Parameter Name="introduction" Type="String" />
			<asp:Parameter Name="ID" Type="Int32" />
		</UpdateParameters>
	</asp:AccessDataSource>
	<%-------------------------------------Data Source-------------------------------------------%>
	<div class="container img-rounded gap-ub">
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<h1 class="text-center">Biography-Admin Page</h1>
				<br />
				<div class="form-group">
					<asp:FormView
						ID="FormView1"
						runat="server"
						DataKeyNames="ID"
						DataSourceID="ADSBio"
						CssClass="aspnet100"
						BorderStyle="None">
						<EditItemTemplate>
						<asp:TextBox
							ID="txtIntroduction"
							runat="server"
							Text='<%# Bind("introduction") %>'
							TextMode="MultiLine"
							Rows="10"
							ValidationGroup="Edit"
							CssClass="form-control" MaxLength="300"> 
						</asp:TextBox>
							<asp:RequiredFieldValidator
								runat="server"
								ControlToValidate="txtIntroduction"
								ErrorMessage=" * Introduction is required. *"
								ValidationGroup="Edit"
								CssClass="error">
							</asp:RequiredFieldValidator>
							<br />
							<asp:LinkButton
								ID="UpdateButton"
								runat="server"
								CausesValidation="True"
								CommandName="Update"
								ValidationGroup="Edit"
								Text="Update"
								CssClass="btn btn-primary form-control" />
							&nbsp;
							<asp:LinkButton
								ID="UpdateCancelButton"
								runat="server"
								CausesValidation="False"
								CommandName="Cancel"
								Text="Cancel"
								CssClass="btn btn-primary form-control" />
						</EditItemTemplate>
						<ItemTemplate>
						<asp:TextBox
							ID="introductionLabel"
							runat="server"
							Text='<%# Bind("introduction") %>'
							TextMode="MultiLine"
							Rows="10"
							Enabled="false"
							Width="100%"
							CssClass="form-control" />
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
