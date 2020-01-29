<%@ Page Language="vb" Title="Prospective_Students-Admin" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeFile="pstudents-admin.aspx.vb" Inherits="pstudents_admin" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
	<%-------------------------------------Data Source-------------------------------------------%>
	<asp:AccessDataSource
		ID="ADSResearch"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT * FROM [Prospective]"
		DeleteCommand="DELETE FROM [Prospective] WHERE [ID] = ?"
		UpdateCommand="UPDATE [Prospective] SET [Field1] = ? WHERE [ID] = ?">
		<DeleteParameters>
			<asp:Parameter Name="ID" Type="Int32" />
		</DeleteParameters>
		<UpdateParameters>
			<asp:Parameter Name="Field1" Type="String" />
			<asp:Parameter Name="ID" Type="Int32" />
		</UpdateParameters>
	</asp:AccessDataSource>
	<%-------------------------------------Data Source-------------------------------------------%>
	<div class="container img-rounded gap-ub">
		<div class="form-group">
			<div class="row">
				<div class="col-lg-2"></div>
				<div class="col-lg-8">
					<div class="alert alert-danger">
						<h1>Prospective Students</h1>
					</div>
					<asp:FormView
						ID="GVPros"
						runat="server"
						DataKeyNames="ID"
						DataSourceID="ADSResearch"
						CssClass="aspnet100">
						<EditItemTemplate>
							<asp:TextBox 
								ID="Field1TextBox" 
								runat="server" 
								Text='<%# Bind("Field1") %>'
								TextMode="MultiLine" 
								Rows="10" 
								CssClass="form-control" 
								MaxLength="500"/>
							<br />
							<asp:LinkButton 
								ID="UpdateButton" 
								runat="server"
								CausesValidation="True"
								CommandName="Update"
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
							<asp:TextBox ID="Field1Label"
								runat="server"
								Text='<%# Bind("Field1") %>'
								TextMode="MultiLine"
								Rows="10"
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
				<div class="col-lg-2"></div>
			</div>
		</div>
	</div>
	<br />
	<script type="text/javascript">
		$(document).ready(function () {
			$('html, body').delay(1000).animate({
				scrollTop: $('#ancher').offset().top
			}, 'slow');
		});
	</script>
</asp:Content>
