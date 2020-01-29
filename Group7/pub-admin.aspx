<%@ Page Language="vb" Title="Pub-Admin" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeFile="pub-admin.aspx.vb" Inherits="pub_admin" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
	<%-------------------------------------Data Source-------------------------------------------%>
	<asp:AccessDataSource
		ID="ADSPub"
		runat="server" DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT * FROM [Publication]"
		DeleteCommand="DELETE FROM [Publication] WHERE [ID] = ?"
		InsertCommand="INSERT INTO [Publication] ([year], [title], [link], [linkDesc], [type]) VALUES (?, ?, ?, ?, ?)"
		UpdateCommand="UPDATE [Publication] SET [year] = ?, [title] = ?, [link] = ?, [linkDesc] = ?, [type] = ? WHERE [ID] = ?">
		<DeleteParameters>
			<asp:Parameter Name="ID" Type="Int32" />
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="year" Type="String" />
			<asp:Parameter Name="title" Type="String" />
			<asp:Parameter Name="link" Type="String" />
			<asp:Parameter Name="linkDesc" Type="String" />
			<asp:Parameter Name="type" Type="String" />
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="year" Type="String" />
			<asp:Parameter Name="title" Type="String" />
			<asp:Parameter Name="link" Type="String" />
			<asp:Parameter Name="linkDesc" Type="String" />
			<asp:Parameter Name="type" Type="String" />
			<asp:Parameter Name="ID" Type="Int32" />
		</UpdateParameters>
	</asp:AccessDataSource>
	<asp:AccessDataSource
		ID="ADSType"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT [typeID], [typeName] FROM [pubType]"></asp:AccessDataSource>
	<asp:AccessDataSource
		ID="ADSYear"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT [ID], [year] FROM [pubYear]"></asp:AccessDataSource>
	<%-------------------------------------Data Source-------------------------------------------%>
	<div class="img-rounded gap-ub">
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<h1 class="text-center">Publications-Admin Page</h1>
				<br />
				<asp:FormView
					ID="FormView1"
					runat="server"
					CssClass="aspnet100"
					BorderStyle="None"
					DataSourceID="ADSPub" DataKeyNames="ID">
					<InsertItemTemplate>
						<b>Year:</b>
						<asp:DropDownList
							ID="DropDownList1"
							runat="server"
							DataSourceID="ADSYear"
							DataTextField="Year"
							DataValueField="ID"
							SelectedValue='<%# Bind("year") %>'
							CssClass="form-control">
						</asp:DropDownList>
						<br />
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
							runat="server" Text='<%# Bind("title") %>'
							CssClass="form-control"
							TextMode="MultiLine"
							Rows="5"
							MaxLength="50" />

						<br />
						<b>Link (Optional):</b>
						<asp:TextBox
							ID="txtLink"
							runat="server"
							Text='<%# Bind("link") %>'
							CssClass="form-control"
							MaxLength="50" />
						<br />
						<b>Link Desc. (Optional):</b>
						<asp:TextBox
							ID="txtLinkDesc"
							runat="server"
							Text='<%# Bind("linkDesc") %>'
							CssClass="form-control"
							MaxLength="50" />
						<br />
						<b>Type:</b>
						<asp:DropDownList
							ID="ddlType"
							runat="server"
							DataSourceID="ADSType"
							DataTextField="typeName"
							DataValueField="typeID"
							SelectedValue='<%# Bind("type") %>'
							CssClass="form-control">
						</asp:DropDownList>
						<br />
						<asp:ValidationSummary
 
							DisplayMode="BulletList"
							EnableClientScript="true"
							runat="server"
							ValidationGroup="Add"
							ShowSummary="true"
							Font-Bold="true"
							CssClass="validationSummary" />
						<asp:LinkButton
							ID="InsertButton"
							runat="server"
							CausesValidation="True"
							CommandName="Insert"
							ValidationGroup="Add"
							Text="Insert"
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
					ID="GridView1"
					runat="server"
					AllowPaging="True"
					PageSize="15"
					AllowSorting="True"
					AutoGenerateColumns="False"
					DataKeyNames="ID"
					CssClass="table table-striped text-center"
					BorderStyle="None"
					GridLines="None"
					DataSourceID="ADSPub">
					<Columns>
						<asp:TemplateField HeaderText="Year" SortExpression="year">
							<EditItemTemplate> 
						<asp:DropDownList
							ID="DropDownList1"
							runat="server"
							DataSourceID="ADSYear"
							DataTextField="Year"
							DataValueField="ID"
							SelectedValue='<%# Bind("year") %>'
							CssClass="form-control">
						</asp:DropDownList>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label
									ID="Label1"
									runat="server"
									Text='<%# Bind("year") %>'>
								</asp:Label>
							</ItemTemplate>
							<ItemStyle Width="15%"></ItemStyle>
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Title" SortExpression="title">
							<EditItemTemplate>
								<asp:TextBox
									ID="txtTitle" runat="server"
									Text='<%# Bind("title") %>'
									TextMode="MultiLine"
									Width="100%"
									Rows="5"
									CssClass="form-control">
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
								<asp:Label ID="Label2" runat="server"
									Text='<%# Bind("title") %>'>
								</asp:Label>
							</ItemTemplate>
							<ItemStyle Width="35%"></ItemStyle>
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Link Desc." SortExpression="linkDesc">
							<EditItemTemplate>
								<asp:TextBox
									ID="txtLinkDesc"
									runat="server"
									Text='<%# Bind("linkDesc") %>'
									Width="100%"
									Rows="5"
									MaxLength="50"
									CssClass="form-control">
								</asp:TextBox>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label
									ID="Label4"
									runat="server"
									Text='<%# Bind("linkDesc") %>'>
								</asp:Label>
							</ItemTemplate>
							<ItemStyle Width="10%"></ItemStyle>
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Link" SortExpression="link">
							<EditItemTemplate>
								<asp:TextBox
									ID="txtLink"
									runat="server"
									Text='<%# Bind("link") %>'
									TextMode="MultiLine"
									Width="100%"
									Rows="5"
									MaxLength="50"
									CssClass="form-control">
								</asp:TextBox>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:TextBox
									ID="Label3"
									runat="server"
									Text='<%# Bind("link") %>'
									TextMode="MultiLine"
									Width="100%"
									Rows="5"
									Enabled="false">
								</asp:TextBox>
							</ItemTemplate>
							<ItemStyle Width="20%"></ItemStyle>
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Type" SortExpression="type">
							<EditItemTemplate>
								<asp:DropDownList
									ID="ddlType"
									runat="server"
									DataSourceID="ADSType"
									DataTextField="typeName"
									DataValueField="typeID"
									SelectedValue='<%# Bind("type") %>'
									CssClass="form-control">
								</asp:DropDownList>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:DropDownList
									ID="ddlType"
									runat="server"
									DataSourceID="ADSType"
									DataTextField="typeName"
									DataValueField="typeID"
									SelectedValue='<%# Bind("type") %>'
									CssClass="form-control" Enabled="false">
								</asp:DropDownList>
							</ItemTemplate>
							<ItemStyle Width="15%"></ItemStyle>
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:CommandField
							ShowEditButton="True"
							ButtonType="Button"
							ItemStyle-Width="5%"
							ControlStyle-CssClass="btn btn-default"
							ValidationGroup="Edit">
							<ControlStyle CssClass="btn btn-default"></ControlStyle>
							<ItemStyle Width="5%"></ItemStyle>
						</asp:CommandField>
						<asp:CommandField
							ShowDeleteButton="True"
							ButtonType="Button" ItemStyle-Width="5%"
							ControlStyle-CssClass="btn btn-danger">
							<ControlStyle CssClass="btn btn-danger"></ControlStyle>
							<ItemStyle Width="5%"></ItemStyle>
						</asp:CommandField>
					</Columns>
					<PagerStyle CssClass="pagination-ys" Width="100%" HorizontalAlign="Center" />
				</asp:GridView>
			</div>
			<div class="col-lg-2"></div>
		</div>
	</div>
</asp:Content>
