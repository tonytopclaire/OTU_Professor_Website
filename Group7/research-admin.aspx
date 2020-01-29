<%@ Page Language="VB" Title="Research-Admin" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeFile="research-admin.aspx.vb" Inherits="research_admin" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
	<%-------------------------------------Data Source-------------------------------------------%>
	<asp:AccessDataSource
		ID="ADSResearch"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT * FROM [Research]"
		DeleteCommand="DELETE FROM [Research] WHERE [ID] = ?"
		InsertCommand="INSERT INTO [Research] ([name], [description], [iLink], [iDesc], [eLink], [eDesc], [images]) VALUES (?, ?, ?, ?, ?, ?, ?)"
		UpdateCommand="UPDATE [Research] SET [name] = ?, [description] = ?, [iLink] = ?, [iDesc] = ?, [eLink] = ?, [eDesc] = ?, [images] = ? WHERE [ID] = ?">
		<DeleteParameters>
			<asp:Parameter Name="ID" Type="Int32" />
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="name" Type="String" />
			<asp:Parameter Name="description" Type="String" />
			<asp:Parameter Name="iLink" Type="String" />
			<asp:Parameter Name="iDesc" Type="String" />
			<asp:Parameter Name="eLink" Type="String" />
			<asp:Parameter Name="eDesc" Type="String" />
			<asp:Parameter Name="images" Type="String" />
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="name" Type="String" />
			<asp:Parameter Name="description" Type="String" />
			<asp:Parameter Name="iLink" Type="String" />
			<asp:Parameter Name="iDesc" Type="String" />
			<asp:Parameter Name="eLink" Type="String" />
			<asp:Parameter Name="eDesc" Type="String" />
			<asp:Parameter Name="images" Type="String" />
			<asp:Parameter Name="ID" Type="Int32" />
		</UpdateParameters>
	</asp:AccessDataSource>
	<%-------------------------------------Data Source-------------------------------------------%>
	<div class="img-rounded gap-ub">
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<h1 class="text-center">Research-Admin Page</h1>
				<br />
				<asp:FormView
					ID="FormView1"
					runat="server"
					DataKeyNames="ID"
					DataSourceID="ADSResearch"
					CssClass="aspnet100"
					BorderStyle="None">
					<InsertItemTemplate>
						<table class="aspnet100">
							<tr>
								<th style="width: 15%">
									<asp:RequiredFieldValidator
										runat="server"
										ControlToValidate="studentName"
										ErrorMessage="* Student name is required. *"
										ValidationGroup="Add"
										Text="*"
										CssClass="error">
									</asp:RequiredFieldValidator>
									Project Name:</th>
								<th style="width: 85%" colspan="4">
										<asp:RequiredFieldValidator
										runat="server"
										ControlToValidate="txtDescription"
										ErrorMessage="* Project description is required. *"
										ValidationGroup="Add"
										Text="*"
										CssClass="error">
									</asp:RequiredFieldValidator>					
									Project Description:</th>
							</tr>
							<tr>
								<td style="width: 15%">
									<asp:TextBox
										ID="studentName"
										runat="server"
										Text='<%# Bind("name") %>'
										TextMode="MultiLine" Rows="5"
										CssClass="form-control">
									</asp:TextBox>
								</td>
								<td style="width: 85%" colspan="4">
									<asp:TextBox
										ID="txtDescription"
										runat="server"
										Text='<%# Bind("description") %>'
										TextMode="MultiLine" Rows="5"
										CssClass="form-control">
									</asp:TextBox>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<th style="width: 15%">Internal Link Desc.:</th>
								<th style="width: 20%">Internal Link Address:</th>
								<th style="width: 15%">External Link Desc.:</th>
								<th style="width: 20%">Extra Link Address:</th>
								<th style="width: 15%">Image address:</th>
							</tr>
							<tr>
								<td style="width: 15%">
									<asp:TextBox
										ID="Label4"
										runat="server" Text='<%# Bind("iDesc") %>'
										TextMode="MultiLine"
										Rows="5" CssClass="form-control">
									</asp:TextBox>
								</td>
								<td style="width: 20%">
									<asp:TextBox
										ID="Textbox"
										runat="server"
										Text='<%# Bind("iLink") %>'
										TextMode="MultiLine"
										Rows="5"
										CssClass="form-control">
									</asp:TextBox>
								</td>
								<td style="width: 15%">
									<asp:TextBox
										ID="Label6"
										runat="server"
										Text='<%# Bind("eDesc") %>'
										TextMode="MultiLine"
										Rows="5" CssClass="form-control">
									</asp:TextBox>
								</td>
								<td style="width: 20%">
									<asp:TextBox
										ID="Label5"
										runat="server"
										Text='<%# Bind("eLink") %>'
										TextMode="MultiLine"
										Rows="5" CssClass="form-control">
									</asp:TextBox>
								</td>
								<td style="width: 15%">
									<asp:TextBox
										ID="Label7"
										runat="server"
										Text='<%# Bind("images") %>'
										TextMode="MultiLine"
										Rows="5"
										CssClass="form-control">
									</asp:TextBox>
								</td>
							</tr>
						</table>
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
						<asp:LinkButton ID="NewButton"
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
					AutoGenerateColumns="False"
					DataKeyNames="ID"
					DataSourceID="ADSResearch"
					BorderStyle="None"
					GridLines="None"
					class="aspnet100"
					ShowHeader="False">
					<Columns>
						<asp:TemplateField SortExpression="name">
							<ItemTemplate>
								<table class="table table-striped" style="width: 95%">
									<tr>
										<th style="width: 15%">Project Name</th>
										<th style="width: 85%" colspan="4">Project Description</th>
									</tr>
									<tr>
										<td style="width: 15%">
											<asp:Label
												ID="Label1"
												runat="server"
												Text='<%# Bind("name") %>'>
											</asp:Label>
										</td>
										<td style="width: 85%" colspan="4">
											<asp:Label
												ID="Label2"
												runat="server"
												Text='<%# Bind("description") %>'
												TextMode="MultiLine"
												Rows="5">
											</asp:Label>
										</td>
									</tr>
									<tr>
										<th style="width: 15%">Internal Link Desc.</th>
										<th style="width: 20%">Internal Link Address</th>
										<th style="width: 15%">External Link Desc.</th>
										<th style="width: 20%">Extra Link Address</th>
										<th style="width: 15%">Image address</th>
									</tr>
									<tr>
										<td style="width: 15%">
											<asp:Label ID="Label4"
												runat="server"
												Text='<%# Bind("iDesc") %>'>
											</asp:Label>
										</td>
										<td style="width: 20%">
											<asp:TextBox ID="Textbox"
												runat="server"
												Text='<%# Bind("iLink") %>'
												TextMode="MultiLine"
												Rows="5"
												Enabled="false">
											</asp:TextBox>
										</td>
										<td style="width: 15%">
											<asp:Label ID="Label6"
												runat="server"
												Text='<%# Bind("eDesc") %>'>
											</asp:Label>
										</td>
										<td style="width: 20%">
											<asp:Label ID="Label5"
												runat="server"
												Text='<%# Bind("eLink") %>'
												TextMode="MultiLine"
												Rows="5">
											</asp:Label>
										</td>
										<td style="width: 15%">
											<asp:TextBox ID="Label7"
												runat="server"
												Text='<%# Bind("images") %>'
												TextMode="MultiLine"
												Rows="5"
												Enabled="false">
											</asp:TextBox>
										</td>
									</tr>
								</table>
							</ItemTemplate>
							<EditItemTemplate>
								<table>
									<tr>
										<th style="width: 15%">Project Name:</th>
										<th style="width: 85%" colspan="4">Project Description:</th>
									</tr>
									<tr>
										<td style="width: 15%">
											<asp:TextBox
												ID="txtName"
												runat="server"
												Text='<%# Bind("name") %>'
												TextMode="MultiLine"
												Rows="5"
												CssClass="form-control">
											</asp:TextBox>
											<asp:RequiredFieldValidator
												runat="server"
												ControlToValidate="txtName"
												ErrorMessage="* Project name is required. *"
												ValidationGroup="Edit"
												CssClass="error">
											</asp:RequiredFieldValidator>
										</td>
										<td style="width: 85%" colspan="4">
											<asp:TextBox
												ID="txtDescription"
												runat="server"
												Text='<%# Bind("description") %>'
												TextMode="MultiLine"
												Rows="5"
												CssClass="form-control">
											</asp:TextBox>
											<asp:RequiredFieldValidator
												runat="server"
												ControlToValidate="txtDescription"
												ErrorMessage="* Project description is required. *"
												ValidationGroup="Edit"
												CssClass="error">
											</asp:RequiredFieldValidator>
										</td>
									</tr>
									<tr>
										<th style="width: 15%">Internal Link Desc.</th>
										<th style="width: 20%">Internal Link Address</th>
										<th style="width: 15%">External Link Desc.</th>
										<th style="width: 20%">Extra Link Address</th>
										<th style="width: 15%">Image address</th>
									</tr>
									<tr>
										<td style="width: 15%">
											<asp:TextBox
												ID="txtInternalDesc"
												runat="server"
												Text='<%# Bind("iDesc") %>'
												TextMode="MultiLine"
												Rows="5"
												CssClass="form-control">
											</asp:TextBox>
										</td>
										<td style="width: 20%">
											<asp:TextBox
												ID="txtInternalLink" runat="server"
												Text='<%# Bind("iLink") %>'
												TextMode="MultiLine"
												Rows="5"
												CssClass="form-control">
											</asp:TextBox>
										</td>
										<td style="width: 15%">
											<asp:TextBox
												ID="txtExternalDesc"
												runat="server"
												Text='<%# Bind("eDesc") %>'
												TextMode="MultiLine"
												Rows="5"
												CssClass="form-control">
											</asp:TextBox>
										</td>
										<td style="width: 20%">
											<asp:TextBox ID="txtExternalELink"
												runat="server"
												Text='<%# Bind("eLink") %>'
												TextMode="MultiLine"
												Rows="5"
												CssClass="form-control">
											</asp:TextBox>
										</td>
										<td style="width: 15%">
											<asp:TextBox
												ID="txtImagesLink"
												runat="server"
												Text='<%# Bind("images") %>'
												TextMode="MultiLine"
												Rows="5" CssClass="form-control">
											</asp:TextBox>
										</td>
									</tr>
								</table>
							</EditItemTemplate>
						</asp:TemplateField>
						<asp:CommandField
							ShowEditButton="True"
							ButtonType="Button"
							ItemStyle-Width="5%"
							ControlStyle-CssClass="btn btn-default"
							ValidationGroup="Edit" />
						<asp:CommandField
							ShowDeleteButton="True"
							ButtonType="Button"
							ItemStyle-Width="5%"
							ControlStyle-CssClass="btn btn-danger"
							ValidationGroup="Edit" />
					</Columns>
					<%--					<asp:Image ID="Image1" runat="server" ImageUrl="~/Images/header_UOITlogo.gif"></asp:Image><br/><br/>--%>
				</asp:GridView>
			</div>
			<div class="col-lg-2"></div>
		</div>
	</div>
</asp:Content>

