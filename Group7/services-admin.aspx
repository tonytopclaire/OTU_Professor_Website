<%@ Page Language="VB" Title="Services-Admin" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeFile="services-admin.aspx.vb" Inherits="services_admin" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
	<%-------------------------------------Data Source-------------------------------------------%>
	<asp:AccessDataSource
		ID="ADSServiceP"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT * FROM [Service]"
		DeleteCommand="DELETE FROM [Service] WHERE [ID] = ?"
		InsertCommand="INSERT INTO [Service] ([desc], [linkDesc], [link], [typeID]) VALUES (?, ?, ?, ?)"
		UpdateCommand="UPDATE [Service] SET [desc] = ?, [linkDesc] = ?, [link] = ?, [typeID] = ? WHERE [ID] = ?">
		<DeleteParameters>
			<asp:Parameter Name="ID" Type="Int32" />
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="desc" Type="String" />
			<asp:Parameter Name="linkDesc" Type="String" />
			<asp:Parameter Name="link" Type="String" />
			<asp:Parameter Name="typeID" Type="String" />
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="desc" Type="String" />
			<asp:Parameter Name="linkDesc" Type="String" />
			<asp:Parameter Name="link" Type="String" />
			<asp:Parameter Name="typeID" Type="String" />
			<asp:Parameter Name="ID" Type="Int32" />
		</UpdateParameters>
	</asp:AccessDataSource>
	<asp:AccessDataSource
		ID="ADSType"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT [typeID], [typeName] FROM [ServiceType]"></asp:AccessDataSource>
	<%-------------------------------------Data Source-------------------------------------------%>
	<div class="img-rounded gap-ub">
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<h1 class="hovereffect">Program Committee Member:</h1>
				<br />
				<asp:FormView
					ID="FormView1"
					runat="server"
					DataKeyNames="ID"
					DataSourceID="ADSServiceP"
					CssClass="aspnet100"
					BorderStyle="None">
					<InsertItemTemplate>
						<asp:RequiredFieldValidator
							runat="server"
							ControlToValidate="txtTitle"
							ErrorMessage="* Title is required. *"
							ValidationGroup="Add"
							Text="*"
							CssClass="error">
						</asp:RequiredFieldValidator>
						<b>Title:</b>
						<asp:TextBox
							ID="txtTitle"
							runat="server"
							Text='<%# Bind("desc") %>'
							CssClass="form-control" />
						<br />
						<b>link Desc. (optional):</b>
						<asp:TextBox
							ID="linkDescTextBox"
							runat="server"
							Text='<%# Bind("linkDesc") %>'
							CssClass="form-control" />
						<br />
						<b>link (optional):</b>
						<asp:TextBox
							ID="linkTextBox"
							runat="server"
							Text='<%# Bind("link") %>'
							CssClass="form-control"
							TextMode="MultiLine"
							Rows="3" />
						<br />
						<b>Catagory:</b>
						<asp:DropDownList
							ID="ddlStatus"
							runat="server"
							DataSourceID="ADSType"
							DataTextField="typeName"
							DataValueField="typeID"
							SelectedValue='<%# Bind("typeID") %>'
							CssClass="form-control">
						</asp:DropDownList>
						<br />
						<asp:ValidationSummary
							DisplayMode="BulletList"
							EnableClientScript="true"
							runat="server"
							ValidationGroup="Add"
							ShowSummary="true"
							Font-Bold="true" CssClass="validationSummary" />
						<asp:LinkButton
							ID="InsertButton"
							runat="server"
							CausesValidation="True"
							CommandName="Insert"
							Text="Insert"
							ValidationGroup="Add"
							CssClass="btn btn-primary form-control" />
						<asp:LinkButton
							ID="UpdateCancelButton"
							runat="server"
							CausesValidation="False"
							CommandName="Cancel"
							Text="Cancel"
							CssClass="btn btn-warning form-control" />
					</InsertItemTemplate>
					<ItemTemplate>
						<asp:LinkButton
							ID="NewButton"
							runat="server"
							CausesValidation="False"
							CommandName="New"
							Text="+ New Record"
							CssClass="btn btn-info"
							Width="100%" />
					</ItemTemplate>
				</asp:FormView>
				<br />
				<asp:GridView
					ID="GVSServiceP"
					runat="server"
					AutoGenerateColumns="False"
					DataSourceID="ADSServiceP"
					CssClass="table table-striped text-center"
					BorderStyle="None"
					AllowSorting="True"
					GridLines="None"
					DataKeyNames="ID">
					<Columns>
						<asp:TemplateField HeaderText="Title" SortExpression="desc">
							<EditItemTemplate>
								<asp:TextBox
									ID="txtTitle"
									runat="server"
									Text='<%# Bind("desc") %>'
									CssClass="text-center aspnet100">
								</asp:TextBox>
								<asp:RequiredFieldValidator
									runat="server"
									ControlToValidate="txtTitle"
									ErrorMessage="* Title is required. *"
									ValidationGroup="Edit"
									CssClass="error">
								</asp:RequiredFieldValidator>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label
									ID="Label1"
									runat="server"
									Text='<%# Bind("desc") %>'>
								</asp:Label>
							</ItemTemplate>
							<ItemStyle Width="40%" />
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="link Desc." SortExpression="linkDesc">
							<EditItemTemplate>
								<asp:TextBox ID="TextBox2"
									runat="server"
									Text='<%# Bind("linkDesc") %>'
									CssClass="text-center aspnet100">
								</asp:TextBox>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="Label2"
									runat="server"
									Text='<%# Bind("linkDesc") %>'>
								</asp:Label>
							</ItemTemplate>
							<ItemStyle Width="10%" />
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Link Address" SortExpression="link">
							<EditItemTemplate>
								<asp:TextBox ID="TextBox3"
									runat="server" Text='<%# Bind("link") %>'
									CssClass="text-center aspnet100"
									TextMode="MultiLine"
									Rows="3">
								</asp:TextBox>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:TextBox ID="Label3"
									runat="server" Text='<%# Bind("link") %>'
									CssClass="text-center aspnet100"
									TextMode="MultiLine"
									Rows="3"
									Enabled="false">
								</asp:TextBox>
							</ItemTemplate>
							<ItemStyle Width="25%" />
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Catagory" SortExpression="typeID">
							<EditItemTemplate>
								<asp:DropDownList
									ID="ddlStatus"
									runat="server"
									DataSourceID="ADSType"
									DataTextField="typeName"
									DataValueField="typeID"
									SelectedValue='<%# Bind("typeID") %>'
									CssClass="form-control">
								</asp:DropDownList>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:DropDownList
									ID="ddlStatus"
									runat="server"
									DataSourceID="ADSType"
									DataTextField="typeName"
									DataValueField="typeID"
									SelectedValue='<%# Bind("typeID") %>'
									CssClass="form-control"
									Enabled="false">
								</asp:DropDownList>
							</ItemTemplate>
							<ItemStyle Width="15%" />
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:CommandField
							ShowEditButton="True"
							ButtonType="Button"
							ValidationGroup="Edit"
							ItemStyle-Width="5%"
							ControlStyle-CssClass="btn btn-default" />
						<asp:CommandField
							ShowDeleteButton="True"
							ButtonType="Button"
							ItemStyle-Width="5%"
							ControlStyle-CssClass="btn btn-danger" />
					</Columns>
				</asp:GridView>
			</div>
		</div>
		<div class="col-lg-2"></div>
	</div>
</asp:Content>
