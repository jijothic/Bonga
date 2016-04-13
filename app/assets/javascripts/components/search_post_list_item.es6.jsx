class SearchPostListItem extends React.Component {
  render() {
    return (
      <li>
        <a href={this.props.post.url}>
          <img width="35" className="avatar-image" src={this.props.post.avatar_url} />
          {this.props.post.title}
        </a>
      </li>
    );
  }
}

