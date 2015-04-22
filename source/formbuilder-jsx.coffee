TextField = React.createClass
	render: ->

			<div className="field">
				<label>{value}</label>
				<input type="text" placeholder={value} disabled/>
			</div>

SelectFieldType = React.createClass
	componentDidMount: ->
		$(".ui.dropdown").dropdown()
		null

	render: ->

    <div className="inline field">
      <label>Field type:</label>
      <select className="ui dropdown">
        <option value="">Select</option>
        <option value="1">Text</option>
        <option value="0">Boolean</option>
      </select>
    </div>

PreviewPane = React.createClass
  getInitialState: ->
    return { value: 'Hello!', checkboxDisplay: 'block' }
  render: ->
    value = @state.value
    checkboxDisplay = @state.checkboxDisplay

	  <div className ="nine wide column preview">
			<h2 className="ui header medium">Form Preview</h2>
			<div className="ui secondary segment">
				<div className="ui form">
					<TextField/>
				</div>
			</div>
		</div>


FormEditor = React.createClass
  getInitialState: ->
    { value: 'Hello!', checkboxDisplay: 'block' }

  handleChange: (event) ->
    @setState value: event.target.value
    return

  handleCheckbox: (event) ->
    @setState checkboxDisplay: if event.target.checked then 'block' else 'none'
    return
		
  render: ->
    value = @state.value
    checkboxDisplay = @state.checkboxDisplay

    <div className="ui segment grid">
					<div className ="seven wide column">
						<div className="ui form">

							<label className="ui medium header">Field settings</label>
							<br/><br/>

							<div className="inline field">
								<label>Field title:</label>
								<input className="ui input" type="text" placeholder="Title" onChange={this.handleChange} /><br/>
							</div>

							<div className="inline field">
								<label className="six wide">Field description:</label>
								<input className="ui input" type="text" placeholder="Description" onChange={this.handleChange} /><br/>
							</div>

							<SelectFieldType/>

							<a className="ui primary button">
								Add field
							</a>
						</div>
					</div>
					<PreviewPane/>
		</div>


	React.render(
		<FormEditor/>,
		document.getElementById('example')
	)
