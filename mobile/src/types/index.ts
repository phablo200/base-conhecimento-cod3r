export interface Article {
  id: number;
  author: string;
  description: string;
  imageUrl?: string;
  name: string;
  content?: string;
}

export interface Category {
  id: number;
  name: string;
  parentId?: number;
  path: string;
}

export interface StackParams {
  Login: undefined;
  Home: undefined;
  Article: {
    id: number;
  };
}
