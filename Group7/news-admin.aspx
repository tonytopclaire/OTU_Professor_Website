<%@ Page Language="VB" Title="news-Admin" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeFile="news-admin.aspx.vb" Inherits="news_admin" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
	<%-------------------------------------Data Source-------------------------------------------%>
	<asp:AccessDataSource
		ID="ADSNews"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		DeleteCommand="DELETE FROM [News] WHERE [ID] = ?"
		InsertCommand="INSERT INTO [News] ([title], [desc], [linkDesc], [link], [date]) VALUES (?, ?, ?, ?, ?)"
		SelectCommand="SELECT * FROM [News]"
		UpdateCommand="UPDATE [News] SET [title] = ?, [desc] = ?, [linkDesc] = ?, [link] = ?, [date] = ? WHERE [ID] = ?">
		<DeleteParameters>
			<asp:Parameter Name="ID" Type="Int32" />
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="title" Type="String" />
			<asp:Parameter Name="desc" Type="String" />
			<asp:Parameter Name="linkDesc" Type="String" />
			<asp:Parameter Name="link" Type="String" />
			<asp:Parameter Name="date" Type="DateTime"/>
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="title" Type="String" />
			<asp:Parameter Name="desc" Type="String" />
			<asp:Parameter Name="linkDesc" Type="String" />
			<asp:Parameter Name="link" Type="String" />
			<asp:Parameter Name="date" Type="DateTime" />
			<asp:Parameter Name="ID" Type="Int32" />
		</UpdateParameters>
	</asp:AccessDataSource>
	<%-------------------------------------Data Source-------------------------------------------%>
	<div class="img-rounded gap-ub">
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<h1 class="text-center">News-Admin Page</h1>
				<br />
				<asp:FormView
					ID="FVNews"
					runat="server"
					DataKeyNames="ID"
					DataSourceID="ADSNews"
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
							Text='<%# Bind("title") %>'
							CssClass="form-control"
							MaxLength="50" />
						<br />
						<asp:RequiredFieldValidator
							runat="server"
							ControlToValidate="txtDesc"
							ErrorMessage="* Description is required. *"
							ValidationGroup="Add"
							Text="*"
							CssClass="error">
						</asp:RequiredFieldValidator>
						<b>Description:</b>
						<asp:TextBox
							ID="txtDesc"
							runat="server"
							Text='<%# Bind("desc") %>'
							CssClass="form-control"
							TextMode="MultiLine"
							Rows="5"
							MaxLength="50" />
						<br />
						<b>Link Desc. (Optional):</b>
						<asp:TextBox
							ID="linkDescTextBox"
							runat="server"
							Text='<%# Bind("linkDesc") %>'
							CssClass="form-control"
							MaxLength="50" />
						<br />
						<b>Link (Optional): </b>
						<asp:TextBox
							ID="linkTextBox"
							runat="server"
							Text='<%# Bind("link") %>'
							CssClass="form-control"
							MaxLength="50" />
						<br />
						<b>Date:
						<asp:Calendar
							ID="Calendar1"
							runat="server"
							SelectedDate='<%# Bind("date") %>'
							Width="100%"></asp:Calendar>
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
							ValidationGroup="Add"
							Width="100%" />
					</ItemTemplate>
				</asp:FormView>
				<br />
				<asp:GridView
					ID="GVNews"
					runat="server"
					AllowSorting="True"
					AutoGenerateColumns="False"
					DataKeyNames="ID"
					DataSourceID="ADSNews"
					CssClass="table table-striped text-center"
					BorderStyle="None"
					GridLines="None" AllowPaging="true"
					PageSize="15">
					<Columns>
						<asp:TemplateField HeaderText="Title" SortExpression="title">
							<EditItemTemplate>
								<asp:TextBox
									ID="txtTitle"
									runat="server"
									Text='<%# Bind("title") %>'
									TextMode="MultiLine"
									Width="100%"
									Rows="5"
									MaxLength="50">
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
									Text='<%# Bind("title") %>'>
								</asp:Label>
							</ItemTemplate>
							<ItemStyle Width="15%" />
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Description" SortExpression="desc">
							<EditItemTemplate>
								<asp:TextBox
									ID="txtDesc"
									runat="server"
									Text='<%# Bind("desc") %>'
									TextMode="MultiLine"
									Width="100%"
									Rows="5"
									MaxLength="50">>
								</asp:TextBox>
								<asp:RequiredFieldValidator
									runat="server"
									ControlToValidate="txtDesc"
									ErrorMessage="* Description is required. *"
									ValidationGroup="Edit"
									CssClass="error">
								</asp:RequiredFieldValidator>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label
									ID="Label2"
									runat="server"
									Text='<%# Bind("desc") %>'>
								</asp:Label>
							</ItemTemplate>
							<ItemStyle Width="55%" />
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Link Desc. (Optional)" SortExpression="linkDesc">
							<EditItemTemplate>
								<asp:TextBox
									ID="TextBox3"
									runat="server"
									Text='<%# Bind("linkDesc") %>'
									Width="100%"
									TextMode="MultiLine"
									Rows="5"
									MaxLength="50">>
								</asp:TextBox>
							</EditItemTemplate>
							<ItemTemplate>
								<itemstyle width="5%" />
								<asp:Label
									ID="Label3"
									runat="server"
									Text='<%# Bind("linkDesc") %>'>
								</asp:Label>
							</ItemTemplate>
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Link (Optional)" SortExpression="link">
							<EditItemTemplate>
								<asp:TextBox
									ID="TextBox4"
									runat="server"
									Text='<%# Bind("link") %>'
									Width="100%"
									TextMode="MultiLine"
									Rows="5"
									MaxLength="50">>
								</asp:TextBox>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:TextBox
									ID="TextBox6"
									runat="server"
									Text='<%# Bind("link") %>'
									ReadOnly="true"
									TextMode="MultiLine"
									Rows="5"
									Enabled="false">
								</asp:TextBox>
							</ItemTemplate>
							<ItemStyle Width="15%" />
							<HeaderStyle CssClass="aspText" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Date" SortExpression="date">
							<EditItemTemplate>
								<asp:Calendar
									ID="Calendar1"
									runat="server"
									VisibleDate='<%# Eval("date") %>'
									SelectedDate='<%# Bind("date") %>'
									Width="100%"></asp:Calendar>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label
									ID="Label5"
									runat="server"
									Text='<%# Eval("date", "{0:d}") %>'>
								</asp:Label>
							</ItemTemplate>
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
							ButtonType="Button"
							ItemStyle-Width="5%"
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
