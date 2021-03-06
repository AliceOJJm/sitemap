import React from 'react'
import axios from 'axios'
import _ from 'lodash'

class Sitemap extends React.Component {
  constructor(props) {
    super(props)

    this.state = { pages: [] }
  }

  componentDidMount() {
    axios.get('/api/pages.json')
      .then(res => {
        const { pages } = res.data
        this.setState({ pages })
      })
  }

  renderPage(page, idPrefix) {
    const id = `${idPrefix ? `${idPrefix}.` : ''}${_.snakeCase(page.link_name)}`
    return (
      <li key={page.id} className="list-group-item">
        <a href={page.full_path} id={id}>{page.link_name}</a>
        <ul className="list-group list-group-flush">
          { page.children.map(page => this.renderPage(page, id)) }
        </ul>
      </li>
    )
  }

  render() {
    const { pages } = this.state
    return (
      <div>
        <h2>Sitemap</h2>
        <ul className="list-group list-group-flush">
          { pages.map(page => this.renderPage(page)) }
        </ul>
      </div>
    )
  }
}

export default Sitemap
